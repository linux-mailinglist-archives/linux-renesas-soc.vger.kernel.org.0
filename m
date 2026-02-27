Return-Path: <linux-renesas-soc+bounces-28522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDBZEmF8oWkUtgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:13:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFDB1B6677
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36A7E302F22C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 11:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25460364930;
	Fri, 27 Feb 2026 11:13:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9128CF6F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190812; cv=none; b=qht3iQFbilWHBuvj0r41l/8ii4AWOVLaqa8k7JmQf161iLK/XT43cezHBB0BwTHYRoGQByjtaVmc4SXrK+evMdimURYkf66xlS5ldoyyZHvg37CTsU9YTxPwz9cOXnM2Kn89ojmmFgHUiIw8tjos2wctNp6268rR/QyXaDJhMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190812; c=relaxed/simple;
	bh=Xt8T2LYzOXOEoVBpymcZc2eRgsOEoxFq4GkPu2abpQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/cIpLzD9Az/T395mq0u+QVpN1ZgVoueEVdA+AdhXLEMnpPWXN2preUE0khfUv8GN7hMYKdtGykQo+eiUezj67sSLoMqlAkF7gn9h9zDTC1iAtGptVtYR5h3wV/k+dN6uU2av6nuw9jEuxGsTBgEwJGnDCdTkrD9FTOVZkQZhjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82742aa5a3eso812379b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190810; x=1772795610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE98lzQphAGWmhBl2muiZY2HaF/hBooDn284eHmY7ZY=;
        b=Ar30hWSulrm50Ic1KqVjapyQoQ6KQHAzRQsbgNdYKAWDFM9Qq4pHDzX+lDDZzXg2jZ
         OQAG46Gy0NnPC1Xd95k0ZvBVNW0foPylxQmxHYjDn8ZMf8BjKC+iTodKSvzdFSp3Dmq9
         mSGpnO18A8+cO0LeYFSRvhsbkKw3uqXF9C8jHFVuWbp0I9ARhd9Fd+MWfhnUuiSO9E3Q
         x0YNIc3LSyatpJg4TInamXxptoXG4NjauUqJZ30ds4cOOijL5mJa9CKtptIXdW+AQljL
         AUUhXDNmjY9w2Y5PIm5guof5o800HI5muh+aNQvaIaYTuEAHv2kjm85SF/xw1fObFwO6
         SWCA==
X-Forwarded-Encrypted: i=1; AJvYcCWEW/HcNvHusjs5DJo3sIia91lhlZuKRzTOs9AmzUex86kjWpzNQH6lAIig5B7C2nNrxMjgOmI7UI+hBqtJfE5EqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqK/t0ba0sOQA8d0Xm8GdWF2tszyUK03wpwFItmQtH4sQgccK8
	C9E79CpBAa48qzVBloPwcpW3ds06fd9ihjd1aAufKewiqi88GHWPZkmY4P1I3nF5Bcs=
X-Gm-Gg: ATEYQzyJCIGOjeJGK656Iy2aiCx1K8dapSn+sbqL6YTZUwBX/fNWjwVTwg4+7pChZcH
	RzBGPV4QZtIoitcuiNdm5dbUexhWjbuOGd3FFp6XMR+S6pMiOyX+q51S1POlcQDgNVAI5cYkSZZ
	+oDmlBnIRGxEIUXwYSZ/U/0VfjX/c1a8k8kS9alNlicum47RYRW9CXMJrCHU/vmEmzdD5erxpVn
	8idyX5TvtSS22xFB4MUQm+tLJpeL18z7u3J5LiONqsKXSHp1YTFhsLUBTmppc5zbMBAnH5IcSOa
	w3oh/MfH46hXjpfCFzNgxK8L+HVmbNs7RgkYoYileUzQQPZBpag3G3Mk90FjHlE/5VYJgDNsXDJ
	79Sth9DyMQMuBpvL41G9+ry/0t4yEg7UpLZkaj+tr6Kbmt9dDgY5+R78l1Pt+h5KidLorv4pplE
	EE4P0GYfybFrRKlBOt/kZpo9dC23tM1FaMlsbXp56qcaA5GATJ3XNhfdMgRTw=
X-Received: by 2002:a05:6a00:2d21:b0:827:35aa:edf8 with SMTP id d2e1a72fcca58-8274da27921mr1970584b3a.65.1772190810263;
        Fri, 27 Feb 2026 03:13:30 -0800 (PST)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com. [74.125.82.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm4856527b3a.52.2026.02.27.03.13.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:13:30 -0800 (PST)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12732e6a123so1871728c88.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:13:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrN+2qUO8zV76hGdloGjPhxegheAhbp41+yidVP5yvz9g4el0jaHkjZ3Lkxp3Cyy627W8D+VCMLLaBzNNo8/QOpg==@vger.kernel.org
X-Received: by 2002:a05:6102:3706:b0:5fe:af0c:79ff with SMTP id
 ada2fe7eead31-5ff324c037cmr877780137.19.1772190379919; Fri, 27 Feb 2026
 03:06:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com> <20260203135139.28151-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260203135139.28151-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 12:06:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4HvawRF1bc=Mu-QvPFpfLMKq8g80-XQxFgOnJYR2kNg@mail.gmail.com>
X-Gm-Features: AaiRm52nImXCDA3sCOv8r6ic4zHbeM7lAITmoRTYT0g3eih1AUtSRh5Hi90xueA
Message-ID: <CAMuHMdW4HvawRF1bc=Mu-QvPFpfLMKq8g80-XQxFgOnJYR2kNg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] clk: versaclock3: Prefix clock names with DT node name
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com,vger.kernel.org,bootlin.com];
	TAGGED_FROM(0.00)[bounces-28522-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 7AFDB1B6677
X-Rspamd-Action: no action

Hi Ovidiu,

On Tue, 3 Feb 2026 at 14:52, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Similar to commit f491276a5168 ("clk: vc5: Allow Versaclock driver to
> support multiple instances"), prefix clock names with the device tree
> node name to allow multiple VersaClock3 devices to be registered
> simultaneously.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -1137,6 +1137,7 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
>         struct device *dev = &vc3->client->dev;
>         struct clk_parent_data *pd;
>         struct clk_init_data init;
> +       const char *name;
>         int ret;
>
>         if (!hw_data->data)
> @@ -1147,7 +1148,15 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
>         if (!pd)
>                 return -ENOMEM;
>
> +       name = kasprintf(GFP_KERNEL, "%pOFn.%s", dev->of_node,
> +                        template->hw.init->name);

"%pOFn" is still not unique.  As per the Generic Names Recommendation
in the Devicetree Specification, it should be "clock-controller"
everywhere.  Using the I2C device name instead should work fine.
The same issue is present in the Versaclock 5 driver (but
e.g. beacon-renesom-som.dtsi uses "versaclock-som").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

