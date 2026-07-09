Return-Path: <linux-renesas-soc+bounces-34940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0vkFAvJvT2rIggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 11:54:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7904E72F2BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 11:54:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 322EB302BBA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 09:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D023E7BD9;
	Thu,  9 Jul 2026 09:50:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E0402BA0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 09:49:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590605; cv=none; b=hN4y770y/YhtRt6mdb5YKyz/m6PR90B96Z/wR+8YGUtm7UBrnoFKr5VbR8h9yy2Jr2Ul+pUsump8LSCmfco22GdQ2ctGATYqbk5O4UCmwMNH5hwAGpkTbaTKU+8h2RR54zr67D8fZfAmSPdRA+fyxUxRBZwVVpdi/B19oAi+bV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590605; c=relaxed/simple;
	bh=XyB0QJBI/ArxNnxn06+fFpma6hNeLNHAjblX5FcA1C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljUoXV5fjqzm1Aon9FRP1Akht4ht1NDPtcZyYaLv5FiDsT5OFUqJ0vRvtXaIPjyrRV6/VqKzQIpymFlI0KC1UPJChmIQdZECn1vL9OZ7P4QsBegpwdJMdqUIg3wHFDw+8S09ZQ/AMD0+3nX1UYSNbSva5EyPXARxqVx1QYlFlaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso566233241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 02:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590595; x=1784195395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBx1Lwl28bs84XHLARf2PZgvr/qdRO+0Qc3qcd6uTMQ=;
        b=DxDsVfdoM2/U8XqfxCQfpgu6TSNG+Jzjqqla3R6+NzvWgw2h5ZjlUldTfs/HBA+kqh
         nTrpHlnv+3oM3qQVeEJzMxHZIHmMh5aHruKivjGn1/B5Hz1VjkMfvgzQL5nwTJJ49aqc
         /D15UudNdqrTOzInnwiFV4IQT+ZfSEHnVfWEhuu5pwcp7+h4CBOgDj2Utz0Tvkptkr1W
         gR+gOKoI3+6xDJzB4ImSeok8ng1lbt+sbeNE7RFHIA7He/9PeXbxlu20F/vn3U8z9mao
         HIiPeIFHMX2xiHf92smrU0CMcpdnGhd2D+V+OX93dvJl6tyZnfOGsXUA5B9m/R+LL1JW
         E+4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9G6scaFbEtD0Y1ZHpJ9RSK2JDao/nl8pwhFFItoQch2Xjwx74RJ9riJGps6JVDm1yuQ63fiTHvbTaW93+XSGD/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4wA9ZfOh5oz5492GZMDo0legISjdhMMCJ3wCTNXWxgXVZx+H7
	8ROGtjGgeHFadxcfO5RKBsU8k0lVRTT1feP89ZNOZ373cCusVg3lKehc4O0GUwvPESU=
X-Gm-Gg: AfdE7cnUIEFT8oF/LLalePF1/m4q2qjfNlXDskGGSjOWLlbamtiCzQNIzW1u9Iavxu7
	8MuVQtRPlUWoN12U366uBLINs7ts1paMMGMYqbIR3TLn+DEfC6+Z2ga2wSrNV63hoAzxXE9ql4R
	7lIlTfzu+gSrbQchEVmmlYB/SLWfbcAL40UfTGiORR27rtTMhnbo3WJeEDcnPcE94JLHx6mUVK1
	BNzfzWKkb/Icb0VPO0nLXKYOvg1/S/7N5YVuVUdcX1vr+imW6cFNzqZN+spHfw/tTEi+3tLEkE5
	UWcoTr7KWhnCq6/VqS5cZZ/IccB4wVeWRnArgwTkNgKDLVzoAl1nCC1SlQqdMrrMQuk94L5xIYi
	atqzrMf3AJWWojsf+x2tPOjd/4BkItcorAe8qNu3o0uxK4tFmMtg6hjyxDLSgmR+nhZb5dvQkeN
	fPnRvBaNc/hd80O3/mVQNY9ywq5KkU8Ni4X8I4VTxWWJWZYGBahQ==
X-Received: by 2002:a05:6102:580a:b0:740:1df0:6ce1 with SMTP id ada2fe7eead31-744dfed34f0mr3434092137.2.1783590594960;
        Thu, 09 Jul 2026 02:49:54 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3186d3esm2747258241.6.2026.07.09.02.49.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:49:53 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9673385b1efso686647241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 02:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrA7UQsKqzD44/tHJVT3Iy8KTlZW+ipBFeqG3Wu9OcIbP+r1pJuj1m1zv782EYsZnk84am0vKXHka889n46r61uLQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id
 ada2fe7eead31-744dfed12b0mr3967593137.6.1783590592726; Thu, 09 Jul 2026
 02:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
In-Reply-To: <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 11:49:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+nHe9kWbBv1k=b-6iixBBJbqeNY-Vq+qbT+wD2g6jUQ@mail.gmail.com>
X-Gm-Features: AUfX_mz8czD0BjSvqmftRZ_pTGys7GO-j5nSESdQS6eSA4Z7r12bLxvVFtqIaAw
Message-ID: <CAMuHMdV+nHe9kWbBv1k=b-6iixBBJbqeNY-Vq+qbT+wD2g6jUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34940-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7904E72F2BD

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > +static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +{
> > +     struct device *dev = priv->dev;
> > +     unsigned long rate;
> > +     struct clk_hw *hw;
> > +     const char *name;
> > +
> > +     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +             rate = fixed_clk_rates[i];
> > +             name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> > +             if (!name)
> > +                     return -ENOMEM;
> > +
> > +             hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
>
> Would it be viable to use devm_clk_hw_register_fixed_rate() here ?

Yes, I think so; thanks!

> > +             if (IS_ERR(hw)) {
> > +                     while (i-- > 0)
> > +                             clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
> > +                     return PTR_ERR(hw);
> > +             }
> > +
> > +             priv->fixed_hws[i] = hw;
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);

And then this, and unregister_fixed_clks() can go, and
r8a78000_cpg_priv.fixed_hws[] is no longer needed after probe.

> > +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

