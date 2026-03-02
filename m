Return-Path: <linux-renesas-soc+bounces-28632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMTGEQmFpWl+DAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:39:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FB1D8CD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 804CA301F3B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 12:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B9136EA84;
	Mon,  2 Mar 2026 12:37:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A526E36F429
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455035; cv=none; b=JccdmFQzcMAyddKF8iFzJoAbSxUOq+sIsE+Oy1gngRWQny1XbuWgx5h8GaVJkUrFdOsX33ECFcjpFgeX1+f1hCj2szTQA51VELfJh4pog1p1XBC1gpV3sT4n8JMgSJnAHyvATjgcvvlpdoR7Wvrfc0CB6+Fxecc6Q7hm9YQis84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455035; c=relaxed/simple;
	bh=ieLd8uA33XYRvC/1/m1UwSIxYq2+WBaleB8sHCAJgK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d43hDm5/UBl4YpKVuEWBxP1jSHjYmINMvP0RF4PqOssuomaFm+ggdCGFOc4YUoQnIUmcPiPBpd/18yNvN1nkTLRg5AHO6Kk8kCk9MwQZGkVQOhNxIQ+K44F4DrRDkw4E7XqKDUtHff9KPoAkvZKnbqUtnBNOLKqoKg0cM8lWWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a973a7bdfso4015149e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455033; x=1773059833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGJIr8wFv9hr5lqBHLuRLwT5yQ6DlyeOxeauruYedWE=;
        b=iZ/005w1tRLcZi3P5qn+p0PSGgxS7BhF9oQN1vPM8h0LgcrqWKfP9lgVa/tHRzh6zB
         0tYCpTQl1vEIDkrc3Lf8QkPAVIMQNdQD0ZQpdpVa5ziJNxAS3d3pxBYcMyeaC53vfjE7
         9VzLmq4/XrX0xW8FsSn/zcqWXhopvjSnaULQykQtE3Is0xqEMSETNyzKMKK8GbjOJy49
         46iwZkhp6sV8H97cx2P0TC/gW/P/HYkkraV9zC4DzJpsBJCH9omlGWx6uuC+qkjDM1kV
         r7CI+2y1c4ZvCxn2I4jcQKharvjMXrTxu+uydv1Bx6t0fLloswvIM74O7IH7Q3N8GPzC
         eIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOYQbBAJyd0bgT0zDPc+NEDPSlXjVd3TLtbGBOVXpgTyBBfUdff42snM8Etk0VQkoeH/ApQc35qr13zUzojKcEtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz15D9vOuUduAwQhpSiMEpeko6eoN3NatZDzGPBPz0HcwiqyLVp
	yToJOaykZ95AFdHt8kb5s8g/r+1DIJOilOc8PaaVlsnc6/15BUqRcfFVurgYm3Ve
X-Gm-Gg: ATEYQzyi+1J4Soxm3Ah4OsBV6GrDQXVog5uhm1qrB7fBEUcwxNrejB5jzmw9HacO+um
	DhDPTerxEOsGD4BgEzKb1PYXk2j/ehtmEfDtcozewYTQ/HcVURFfSWDjgZtMu0eIms8EztoPXRA
	2yaiL67mF6PSBCnu00VheC4AYB7SEoksB1S3gw/6r07/lIHW6H8q+fhouaqKAQKsEbPIV+g0bsr
	MJ78vU4baYzvxQd4nZQoaX6+kgAiJIhbymh/Fplvhb9rFPrjy3YKlaieYOaFlI4e7lZ/TO/srte
	nPn744/ZHh6iLDK9eYuXNIAE5gMa79Uf6HMIJEeNgmcjhwaanngSMZDGavQTvC02696YlOjaGCE
	7KZcMTEHf+ZGo3apc8BhhpTM6ExgZ2u6FryFlFa1mytUFI8GuKiaLutH15ECau8ICs1bXj9iem2
	xdaiz/n3ZITO3NmmWcOPFSzUBWwIPbZ4cBgQ60cjApmUyC8OMq0USfXijOiLAD
X-Received: by 2002:a05:6122:1811:b0:566:3b13:8208 with SMTP id 71dfb90a1353d-56aa09ff008mr5859428e0c.5.1772455032765;
        Mon, 02 Mar 2026 04:37:12 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df645b877sm11765262241.8.2026.03.02.04.37.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:37:12 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94a231b285dso2434156241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:37:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtdJ5Fo6oglpv8cnzl/RR0g91H4mXKqvvOEeid8a77HyKqEAZTY0ghLF181M9CJPBS+Oaf5HZOJQ+qqEvxsy/ryg==@vger.kernel.org
X-Received: by 2002:a05:6102:1629:b0:5f5:46f6:fb29 with SMTP id
 ada2fe7eead31-5ff324e81ffmr5803667137.26.1772455031730; Mon, 02 Mar 2026
 04:37:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-2-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:37:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
X-Gm-Features: AaiRm53-o6YuVgiLNI10tKCGvgnqzSehuU_fUzxc3DHRL4EGR1lrqXZ8SrXsMvo
Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-28632-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.607];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: C84FB1D8CD0
X-Rspamd-Action: no action

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add a clock operation to help determining the effective rate, closest to
> the required one, that a specific clock can support.
>
> Calculation is currently performed kernel side and the logic is taken
> directly from the SCMI Clock driver: embedding the determinate rate logic
> in the protocol layer enables semplifications in the SCMI Clock protocol
> interface and  will more easily accommodate further evolutions where such
> determine_rate logic into is optionally delegated to the platform SCMI
> server.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
>         return ret;
>  }
>
> +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> +                                    u32 clk_id, unsigned long *rate)
> +{
> +       u64 fmin, fmax, ftmp;
> +       struct scmi_clock_info *clk;
> +       struct clock_info *ci = ph->get_priv(ph);
> +
> +       if (!rate)
> +               return -EINVAL;
> +
> +       clk = scmi_clock_domain_lookup(ci, clk_id);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       /*
> +        * If we can't figure out what rate it will be, so just return the
> +        * rate back to the caller.
> +        */
> +       if (clk->rate_discrete)
> +               return 0;
> +
> +       fmin = clk->range.min_rate;
> +       fmax = clk->range.max_rate;
> +       if (*rate <= fmin) {
> +               *rate = fmin;
> +               return 0;
> +       } else if (*rate >= fmax) {
> +               *rate = fmax;
> +               return 0;
> +       }
> +
> +       ftmp = *rate - fmin;
> +       ftmp += clk->range.step_size - 1; /* to round up */
> +       do_div(ftmp, clk->range.step_size);

step_size is u64, while do_div() truncates it to 32-bit.

> +
> +       *rate = ftmp * clk->range.step_size + fmin;
> +
> +       return 0;
> +}
> +
>  static int
>  scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
>                       enum clk_state state,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

