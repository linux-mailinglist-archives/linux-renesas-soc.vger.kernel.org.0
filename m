Return-Path: <linux-renesas-soc+bounces-11111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA79E9724
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 14:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0902C188C820
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 13:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B818233156;
	Mon,  9 Dec 2024 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nQlHcl2f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F135940
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750903; cv=none; b=mxMzYvms1mo2ZMx4N4GzcFIBFiFLIYQPba9efF1uVGicL0xBNp6JlzNpBuOCO3j/y/unFWmLC3+iLAzTS8ODKOWbER6BONqbNtWSToaBPhMgrdRQKWRdiEy5NRjdhn3eQPczCOj6tzWGl/s/1LgXBVUL5YcroieQDLolTLZFp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750903; c=relaxed/simple;
	bh=LdtLkb6g5/mYpUpJpgsKBP9UX9MGU4r33wuzmCaef1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXvWQ8vVWQMm7WiM5WrogDo7Y4Ps4aALR5DrD/sYXzRQ4LZDmMt9AYkDHVD2Psa0Zns7IqgEZKQWbYo7vgAafFQrEHloQTgVRnH+m0FSsh/0TYVZia/U1JpqGUis8hhkitAaT1qWvsJirEwB4q+FQCBQWO8MyAjMD9ktqlPXPEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nQlHcl2f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a736518eso47498705e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Dec 2024 05:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733750899; x=1734355699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=El/TOZDLV/Adncw2igrq2Gpvgb3sMBAUyZwK9Lxfyn8=;
        b=nQlHcl2fX30nw3H+df5FwYFuDnEuQXeiO8VEnOiPRwHdiA1GB2jme0K2vpSjg8Hlu1
         fAWf7Tf1Bm93maXY7Bz3XgRl8nwJ+lNcYDNMuv3pLsfOLUOGIMD+o1vqM/pivWCd0nYM
         IMdNg1kZBPf/Fa8ArUsTrQAm1s38xN0UHf2GzG7cEfG+T/SwU60OZamOk7sjrr5Bg6du
         CASaQtghB2Ys+NEW1dk0ClSPgHYqOuunmS1b0XkZEM25vWLWfcScKGw2ijCQKwh/oFwg
         s4+75N3P3E4agEaXGu+/frPpM5LZMsnFoKSd9QRQ0dspvcxIHIR4y7cPy+7Eye5xZQKR
         gxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750899; x=1734355699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=El/TOZDLV/Adncw2igrq2Gpvgb3sMBAUyZwK9Lxfyn8=;
        b=NWWlL1UkITxJOUKwmjkx+J1R+2WK+eqPYgF9tQVmVCFWydSvVLMLhblkrrlbz5D7Bg
         bqBe8ef/luVrKm2yovFNLVyDC3xwzE1y3RG5+D+n+SuSk2hnMuDFbBq6HbB7Or3SmjWN
         I1Ou5ARnXVLIzeyuH3v+wz6plsX6pNW4KztntymkrKm/QYEE6X2ZyicWevnVIK6Ri86B
         qqdsUVord17cFYAuyFPsezl+pkWwEcN8I06XLt21thMjjuO0fc//zqmnI6+7BKv37jlC
         nqcCqa7oYPK0YIWGdLg7qIhbRJOoT0+6UCysHW8sXyVQYkLcFks7q1k5Q2RNUWG6KmqU
         /hZA==
X-Forwarded-Encrypted: i=1; AJvYcCW4A/OPLlFGR5vgm7YguhqMkNyZcK3HHZTEsgrJDUEn07cRelaE/sJ+8sFpqK9BAQhWLkwD0i90Bwy5l5uDmhKUhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3LnA/HLpBWQ109yPPzuSajkyPVbzgjRaCeKEmNL3beqxUh+F
	5szakZvvPtE9aLiBB4aFUDM0xgbiZpqk+9+2kLN1YQVuAxPk0p2MWMQyQ3FsVME=
X-Gm-Gg: ASbGncshKfXinWFZcMJisi0Hi3TdiVVMvOeyKm0GnEkAcQfcDGto/y1bWDpxoF/X81I
	n1oV9WVj+/0a/HZgjSqmoadcSgH7jz/RFqRjppWP54dmYP4LohHCr56bx/L1oZamMvtlW28i209
	d+/VU5n33dqRcuhrXJBnwv5q+k6Wel4mw5v54OhT4+ap++L2TzSH9x88NWxIal7+d6M30RaAgjT
	t2DKHhkjy1AuMWPQlZi2mUHr2mg62OVN2MYitEA+1Z31AzGhu7kK7LruTo=
X-Google-Smtp-Source: AGHT+IHd1DkHzh1NVNjC22X5kRB98anOoYPZpCUeVEirns6S3aaWq7ub1ihZAzLS2qCt8RPK8fYhhg==
X-Received: by 2002:a05:6000:1868:b0:385:fd24:3317 with SMTP id ffacd0b85a97d-386453cf868mr528412f8f.1.1733750899061;
        Mon, 09 Dec 2024 05:28:19 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67f4c4ae4sm214590966b.111.2024.12.09.05.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:28:18 -0800 (PST)
Message-ID: <c65b8dd7-86e9-4a87-b9ec-bcbaae6dbe98@tuxon.dev>
Date: Mon, 9 Dec 2024 15:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/25] ASoC: renesas: rz-ssi: Terminate all the DMA
 transactions
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUa9GnzOMOBhpQcX88Yy2qvgKmKMdeEwEVo-OXgr-3SMg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUa9GnzOMOBhpQcX88Yy2qvgKmKMdeEwEVo-OXgr-3SMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 09.12.2024 15:15, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:35 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> In case of full duplex the 1st closed stream doesn't benefit from the
>> dmaengine_terminate_async(). Call it after the companion stream is
>> closed.
>>
>> Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> Changes in v3:
>> - collected tags
>> - use proper fixes commit SHA1 and description
> 
> I am not sure which one is the correct one: the above, or commit> 26ac471c5354583c ("ASoC: sh: rz-ssi: Add SSI DMAC support")...

IIRC, I had this one on the previous version but in the review process it
has been proposed to used 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex
support"). I think 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex
support") is the right one as the issue is related to full duplex.


> 
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
>> @@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
>>         rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
>>
>>         /* Cancel all remaining DMA transactions */
>> -       if (rz_ssi_is_dma_enabled(ssi))
>> -               dmaengine_terminate_async(strm->dma_ch);
>> +       if (rz_ssi_is_dma_enabled(ssi)) {
>> +               if (ssi->playback.dma_ch)
>> +                       dmaengine_terminate_async(ssi->playback.dma_ch);
>> +               if (ssi->capture.dma_ch)
>> +                       dmaengine_terminate_async(ssi->capture.dma_ch);
>> +       }
> 
> rz_ssi_stop() is called twice: once for capture, and a second time for
> playback. How come that doesn't stop both?

It is called from this path:

static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,

                              struct snd_soc_dai *dai)

{

        // ...
        case SNDRV_PCM_TRIGGER_STOP:

                rz_ssi_stop(ssi, strm);

                rz_ssi_stream_quit(ssi, strm);


        // ...
}

rz_ssi_stop() is as follow:

static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)

{

        strm->running = 0;



        if (rz_ssi_is_stream_running(&ssi->playback) ||

            rz_ssi_is_stream_running(&ssi->capture))

                return 0;

        // ...
}

rz_ssi_is_stream_running() is as follows:

static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)

{

        return strm->substream && strm->running;

}


The strm->substream is set to NULL in:

static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,

                               struct rz_ssi_stream *strm)

{

        struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);



        rz_ssi_set_substream(strm, NULL);


        // ...
}

Thus, when the 1st full duplex stream is closed, as the companion stream is
still running it doesn't benefit from dmaengine_terminate_async().

I'll update the commit description in the next version.

Thank you for your review,
Claudiu

> Perhaps the checks at the top of rz_ssi_stop() are not correct?
> Disclaimer: I am no sound expert, so I may be missing something...
> 
>>
>>         rz_ssi_set_idle(ssi);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

