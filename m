Return-Path: <linux-renesas-soc+bounces-29776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPiCMtWlummaaAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:17:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E552BC0AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9386630A810C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EBA3D75CC;
	Wed, 18 Mar 2026 13:13:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA93D6CB8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839639; cv=none; b=bsc/paxff0KPfWsrQny70ycrfqTNEWw+UZo5qcdXafPwT67WPTyCU+xOW2QDKQmo+aqfVvDo9nOKJRgkeM3aHC9HP3WtIlHywqHlWFqtLtUokgmKGLr+5EwNzFfBZA3AT6wGkxyx+F76dBd1l5kvBk20YaSdHffDciNjOk5APoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839639; c=relaxed/simple;
	bh=T5LtveweO7oRpHuuZVxpmeUJJkjJ/RN/+mkMo3tV0yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+NMmplbKiJ3HQUoPw8t+KobmbVYgI9CWdbD3ZFKtKjOzoxq1Vqc4m/ufE13ssdZsP4aIx3GaPALoNb0grAGdqQLqtuRekamqELY2EZta2H+Zf2xbTNOY+x5dz4cwa4EPxvx9OXrX0+yaMZPZu3pYbcs2riKq//2Faj9CTeDCNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a9076813bso308178e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839637; x=1774444437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pOV2D2AQYygVxzPMRjkzxP2+EkcN9rcofhLjcRkOTo=;
        b=I78KI2jcEpvYdGjiBh8u77NB/0M29N727V9HLLFs3A9tK1z/eD3nPZKORJfQD1AV8V
         /PU+Ji3fRJinLpQ88fP6KT/b7nqid6Ubi58evGAbwCK1SMXoLVLJreGgw1cSuV4dWa1I
         vH46onT7e9XHZR1886XjYKg8l1VKakbcKJ7OwgYa6sae+ip0jPbDM5vm7XVG5OZgbxMR
         LhZl4mBZedTMmjkf9HKy4xi52EwD7f/UCBlfdJ8k83blmwZAbC2CVlM6h7F45zZ/S38M
         hARMXJPFCue+O9LbJDOeuL9HycNqCzON66eiK1O+XxgCLmhZh7LS+Jjqzv1R1UTFt5z6
         t6ow==
X-Forwarded-Encrypted: i=1; AJvYcCUvej5sj1Egkfq74VSjQOlLX4C5WdNOXRdwAzx3Fzpgp2SJe4a6LyIe9dx2KACgXRnqJv7Ke7YbE8is38HTaP/tQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIGn0XKYbYkaOfsDyscVnG4eEEsrbwuo7WevC1oyDCvi+Up1Yu
	xehfu5TStIQE7D7s7kEQNHb0Cf97lRfLLA1KjNtrnCOmt5WZtd4Gc/LDNj15rNYj28E=
X-Gm-Gg: ATEYQzzEjPbn4etQuyPbH47N+IkWJpJ0SXT34nX4zheGT34PdsgCKPUD0a0fXd6buH9
	TWRJXF6AaaDsZUssp+s7xo+SbEd1TdGEqvA87b23bbsgcg8XHByddcHDPq3PumA/Rvs6RMECF8p
	JEVECY976MTWCRxajhUD+qy+Xw16Y59+tLZoeR3tnrcLn39xCxinyEFQBGC8JfW13cqxfFha+85
	yBZxJqSYqPoUMmxhrtTJqm6QmqvnJZVS4dlhfnIFVfkQEsfPkr0H5yarS31/g6rZMvlxhVztnH+
	O8Ry3DEddpb2LVUhkD/P9x1tDw1Gj/XoyBuY/ihvg4/mLYBT0FtRTBC6MkuqCf1Cy6ZhI/72C2H
	dKIHh7owD86pdAvFOlngwUTxBrxWZOhdE/rEAse1qoJO3Q4W8E46wgwuB0RPhbHPtXhFI9w+z4l
	iZok9fVYUQ0pOqa7pzLIfqY6XJOl8hVkCBVJrEVcOyXEvaHTXzV415aOW7bD5u
X-Received: by 2002:a05:6102:3ec2:b0:5f1:51b1:480 with SMTP id ada2fe7eead31-6027d0ac8d7mr1410046137.8.1773839636900;
        Wed, 18 Mar 2026 06:13:56 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027eddd8e2sm1326682137.9.2026.03.18.06.13.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:13:56 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-950cd03fb5eso176388241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 06:13:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY//Sjb/7i9IaOGRPeleaQo7y2FlJEnYrJmeHnwK2L9r2rU+uo31d7k+MRtagoPwrWWfewcpmcwME+Rv45YUjPRQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e84:b0:5ff:b8d8:b3fa with SMTP id
 ada2fe7eead31-6027d3787c0mr1422469137.27.1773839635338; Wed, 18 Mar 2026
 06:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318120102.226118-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW1ROF3VdKzXVNeKtPZPEwX4MHD-kqdunrNYKBprPgPWw@mail.gmail.com> <TY3PR01MB11346D89F6F7C332FEF0D08B3864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346D89F6F7C332FEF0D08B3864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 14:13:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXph-ns=8hHWoDKoNgUiGQ4=A9+aASim6qrLDdAE_mPMw@mail.gmail.com>
X-Gm-Features: AaiRm528vBhNoRJf_ekwr_tLXDSVAQ-Nywv-15uaGsQg5FUeHbt026b462wtJU0
Message-ID: <CAMuHMdXph-ns=8hHWoDKoNgUiGQ4=A9+aASim6qrLDdAE_mPMw@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR string
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,lists.infradead.org,vger.kernel.org,glider.be,bp.renesas.com,nabladev.com];
	TAGGED_FROM(0.00)[bounces-29776-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.475];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 30E552BC0AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 18 Mar 2026 at 14:08, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 18 Mar 2026 at 13:01, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Fix a malformed MODULE_AUTHOR macro in the RZ/G3E USB3.0 PHY driver
> > > where the author's name and opening angle bracket were missing,
> > > leaving only the email address with a stray closing >. Correct it to
> > > the standard Name <email> format.
> > >
> > > Reported-by: Pavel Machek <pavel@nabladev.com>
> > > Closes:
> > > https://lore.kernel.org/cip-dev/abp4Y2FVspUgEpCT@duo.ucw.cz/T/#ma80454
> > > df129c8cfcbe48d75f3b4abe697925c6f8
> >
> > The "/T/#..." suffix is not really needed.

And after sending, I realized the "/cip-dev" part is also not needed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

