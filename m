Return-Path: <linux-renesas-soc+bounces-27186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOC5ObWfcGlyYgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 10:43:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6164C54998
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 10:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E978962ABDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C593F23C5;
	Wed, 21 Jan 2026 09:34:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DEF3375AA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988092; cv=none; b=itxZFviP0+/DS2IrzbfmbH6gYDkzrLPJbr2sLeggTncvJ/4aNJwOkGgQ+SekZLX0ZrlrI9Acxn1HWoYc5hmKsu2XSyXEexpmGWxInJ9Y/S41dPz3mugyk7cqTy2Eoo9lWsbQAJMSOWjkYUhpv8YVmYe8r3Noe2gpxNeGpCnu+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988092; c=relaxed/simple;
	bh=/DNYZvP4E268YQT58SEjVWMsycgcOqpk49+Jf+XgZc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjgPj0ve8A5IAFX7qIjKQmY5Jz+y9kRiqY0pZRODvP6iIANUc3q5I3k2HRGk4CeaYnhc+4PpDRn09OuUw1FQHRhNaKw52TNN0bKPpDrWE1a0f8Q+2/6JPs8qr979V3W+BqXSyge2tk+pEsWTJGjy+pZu8iyn/1seZkEZB8GzfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-5636b2fde95so1529705e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 01:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988088; x=1769592888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bszhOzJILtErjS2iOIT7irbkOXcUc9F6q/vjpyzjSxg=;
        b=pREr8y31uVORPdmAGAJOA4pNptxcrdIevfr64TCN3IjT5t++eZEW/5ruYQd4XduCVZ
         fS+a8RLcBQgye+UBOshFScHoeBkcQU10kJeZdvOMiWkrACTygz221/8HZn02E1iBjow6
         33ofwOZTwn61390vfKuMjFLOLEarKPmSfiPiW3SmAOBPp7l1FtK5ROXv4M33Inn/WTXg
         YNMUGiyNpdSzUkUdAh+9xv0gVS6YAQACUVeiA2VwdNnBv+jLhXfH3j9FU1MRkA6N2a7T
         E84V7c7/3XiEQVKgWc6Ps5j3ApTKzand0ALyRVWziSigT5IUXOGhHcoEwhMhohcl9b9A
         6Ddg==
X-Forwarded-Encrypted: i=1; AJvYcCXT4R6DaQYQXiHMdwvju3Eid6hw+w5pF//u+nkoFQCKw/RR/N7GQ4r7ZcdkHJSGx5Sbg3Zk90r9YbZxZI4os+p8kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNCPWRirvSMt9CoPDl5lCvSO6DF5Kyn26CMmmv7N82rNQ8XfYK
	sFdVPPPUju3f+IJr4m+DdU6qCtBYhyMnGijAFGXdSWPKbERD9vrzkXb3GtTx0C64
X-Gm-Gg: AZuq6aKglABNOHA/ZbuOfGL5LBmzj2LNueT+3d/Cuxyb3k4ZhWnzB1z/S7f1+qELQn1
	VHOb+xNlJeqdvK9uVOPkDczf/6hchxhIelkGxxMW/zLpE47knPQHXcZfXAnKkHfA5FXsJIoYVZ+
	u63nLqA6DZ35TIC5KUSXsj+NU1/028UfPpcSDEuevV0xxQnsgT9WcMkbGdMSuvoz3/t552ejPAL
	THTtnHM9beiNRAfPM/W3Sls4lSR841WGTd5AhaOs2G4mHL6givnA4JmgYHPBNLiNvqy1ieDqjtF
	kSUbAkiLQwiC5Q8RFs0uDSa3VTAwv2pLCygz2zMBZ/2si5JbSUOWf3YcwkBv7BcWL9xI+rQp4EX
	3hPJnHSYDtb99K7N35d+d3vPRScP67YDYUAJMk2J/DTb2lneXLf5DRVMK1mg0Xam6Ny6mDzrIn3
	jTg1PGN5frSZ2cQHLFyF5TW+/pvBg3voIyqQ/SFMdnEn2c1e+s
X-Received: by 2002:a05:6102:26cc:b0:5f1:4fc3:855d with SMTP id ada2fe7eead31-5f1a55b9305mr5172334137.38.1768988088158;
        Wed, 21 Jan 2026 01:34:48 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03eaad3sm4608747241.7.2026.01.21.01.34.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 01:34:47 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f573ba819so2286397241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 01:34:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWToJ+/fyUhUByd/ywt0IO7cTgUv+VLXl4MsemS2HyO+OxEj2tMdsSz2Djk+H4HZJsuiwSFFc5HqL0DCQUYVfoD+g==@vger.kernel.org
X-Received: by 2002:a05:6102:512a:b0:5db:f47c:15ff with SMTP id
 ada2fe7eead31-5f1a55e7e72mr5057976137.42.1768988087567; Wed, 21 Jan 2026
 01:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4cb63bd8b1e49407831431fbc88b218f720a74fd.1768899891.git.geert+renesas@glider.be>
 <10de432d-b38a-4fe2-959b-d9fa4e08e6c1@mailbox.org>
In-Reply-To: <10de432d-b38a-4fe2-959b-d9fa4e08e6c1@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 10:34:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqRh5B3o5DA=5GU=HBcz-ZeQkCvRVtqOY4tE9H-FHN=Q@mail.gmail.com>
X-Gm-Features: AZwV_QhPTgfdREEwl-zQjOyzg-nMGiQJMf7pwBBdf77lOvlH6kC8tJLlfws-Kcc
Message-ID: <CAMuHMdVqRh5B3o5DA=5GU=HBcz-ZeQkCvRVtqOY4tE9H-FHN=Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rs9: Add clock index range check to rs9_of_clk_get()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.26 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-27186-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,linux-m68k.org:email,mailbox.org:email]
X-Rspamd-Queue-Id: 6164C54998
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Wed, 21 Jan 2026 at 03:24, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/20/26 10:05 AM, Geert Uytterhoeven wrote:
> > rs9_of_clk_get() does not validate the clock index in the passed
> > DT clock specifier.  If DT specifies an incorrect and out-of-range
> > index, this will access memory beyond the end of the clk_dif[] array.
> >
> > Fix by this adding a range check to rs9_of_clk_get().
> >
> > Fixes: 892e0ddea1aa6f70 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This is v2 of "[PATCH] clk: rs9: Convert to clk_hw_onecell_data and
> > of_clk_hw_onecell_get()"
> > (https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be)
> >
> > v2:
> >    - Just add the missing range check; the conversion to
> >      of_clk_hw_onecell_get() can be done later.
> > ---
> >   drivers/clk/clk-renesas-pcie.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
> > index aa108df12e44fb9f..1adc5365ba1a3d59 100644
> > --- a/drivers/clk/clk-renesas-pcie.c
> > +++ b/drivers/clk/clk-renesas-pcie.c
> > @@ -277,6 +277,9 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
> >       struct rs9_driver_data *rs9 = data;
> >       unsigned int idx = clkspec->args[0];
> >
> > +     if (idx >= rs9->chip_info->num_clks)
>
> of_clk_src_onecell_get() does a pr_err("%s: invalid clock index %u\n",
> __func__, idx); on error, should this function do the same ?

I can add it if you want. But this function will (hopefully) be
short-lived anyway.
>
> > +             return ERR_PTR(-EINVAL);
> > +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

