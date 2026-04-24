Return-Path: <linux-renesas-soc+bounces-31640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOXCK9t062kQNAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:49:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B0F45FB36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C09C302EA9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12DB3D75D9;
	Fri, 24 Apr 2026 13:45:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5703D75C8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038300; cv=none; b=c/ZaJ58A9+60Pzap0hw5wv7Ph+Z3oj2g+e/8fNYpYYEKwbQKVEU9FNVi/TCLSLbMVjLvZXx3hnEru2X/2082jKWaJPUVePp8sIiLFhSij9SUeWM+mZYfG7OJ8cBJ0OhGV35V8atFDrR1VVADDAJVCRXqIxYFXm+RUMDWvOT894w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038300; c=relaxed/simple;
	bh=FBo4MpOuHym9isd4kpc6ESQ5scuBE3X0XXVkHE8M6lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW/ugywEzC6XLgbfQHihyNICrhqd2G03B7UBxmA+tgQZjVPbuY+zrR2q7PAelEIRIv8zeBPFXUBIAOg7I4Y53dU1sl7khAl3ikQNhrpIyoSJBcIztxxL06pQ7B6hb7lMbRAg2Ly9iNXjLi0o2TEl7rMlehRHtnFQ8O18Hp4CvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so10495127a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038296; x=1777643096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAdDpaEBGdJ4DrL6veRXDKf9tGg5aCWLhuxw6BI8jYM=;
        b=HticNkC2REuSynxnEp3823ViZri1ajJOTZUcorETjT5CTI+f0yDgwLBBXHNb/2Hgp1
         VSQzxfIG6SH78mDPF2F4q5XhgIHhCnkH/b+s41lHcp2my0KcgTn6gYJKpLRCfdYnWD9+
         9VK8LRc4od3tojnncwnUqI4QmAeXZOqlGasIc5X9P1fkiaM4gsv0w/u86ailj4yAniSc
         GoOvbZfQE/GgagehqR6ZCQlWPn7ib7P5xZ29f3ouhe8Sn0TM3Tk03ULgqJox2LZwqDDY
         iF3mu0cEve4QB9kAmUpj1onqbUQtaxBdBhjuUn4M4n63Ss6mgRzF8cBsKX/tIlBHpQ8x
         uEyA==
X-Forwarded-Encrypted: i=1; AFNElJ+Hh3zcJ1yDBPW06ncr7WO8fO7gXUiXayIN/ymsUlWcf6rmCJ+HpY0NLakJyj3UKY3raivMU/3r7Ux5VBgG/fBGng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6AB7V8mVEoel9nzon3Wu69myyP4tWESYlbc9fKJlYn4s+Cq3
	DZPfhV/qAFhC05w9HB86w1WbrZXwozH+xOKIb6eK1WyYATuwCc+m0iqO/hsAhhicsqs=
X-Gm-Gg: AeBDiesPYjj8h8NOXfSG5fOA9dOj+US6cgHG/ueqqf/Swm6B0EoxNdqQELdCtJ4rYu3
	zru1u0zs8FlSGDu4RN5fsFcffG3wbuQIEAQnCqmhmrqwttvUIPUJ3oUtpHbeeTrKa/VvygCmpYo
	X+93Q7t4lz7qR72xtw/WGu7EjcXtlEzuKKukoOeuz/h5QsENN93/FxuRNTLoYwcuo6C6lVv+Afs
	7tzXmsc+Mt2rmd9SnZkVOmgFbUB0v5gHdF2RSN5yjZlIBANvLp7dmH+YoKRU3z6bsklWubj+KGo
	ZYDBxnFZISu73zMPrzV/nTgWFHb2z9BMftGWqhiXmGkcFHKkGEoF5WoP0UuxKLXJe3YgU+UbxCF
	FJlCKlCk6y3CoElFxyK35hsX1ZDSirJx0hlp01rewuprEIGh6LCzLSizuvMCjfFlorFWRlIfnSU
	n0joICFalg2dSbmVbbQPhjqdcZfYf1BTMN9R/elyVTi2whIQMYwwtJzYdkXy6p6dO+ys+cWY7hG
	mQJOAKi6A==
X-Received: by 2002:a17:906:f592:b0:ba8:a829:e648 with SMTP id a640c23a62f3a-ba8a82a9a54mr1172219066b.24.1777038296312;
        Fri, 24 Apr 2026 06:44:56 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm773445766b.26.2026.04.24.06.44.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6788838d543so3403269a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9rDijGiC9ehE79GqPkSzi0GqQxvXJ3PHCkljBD+LcfnDYkXlcRGrYMFZjwsawCh1ocZdi5S/EIP35SCPQCCgQ50Q==@vger.kernel.org
X-Received: by 2002:a17:907:c10:b0:ba6:8f34:b419 with SMTP id
 a640c23a62f3a-ba68f34b5c5mr1336772766b.13.1777038294976; Fri, 24 Apr 2026
 06:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
X-Gm-Features: AQROBzD95mCpvpKjt-tx1E1uXUYHVxRwIWBz9wiPmciBkPhVEaN-gD0qoxp4r-g
Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 73B0F45FB36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31640-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,mailbox.org:email]

Hi Marek,

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/renesas/clk-r8a7740.c
> +++ b/drivers/clk/renesas/clk-r8a7740.c
> @@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
>         { "zg", CPG_FRQCRA, 16 },
>         { "b", CPG_FRQCRA,  8 },
>         { "m1", CPG_FRQCRA,  4 },
> +       { "ztr", CPG_FRQCRB,  20 },

This is not 100% correct: ZTR has an optional /2 post-divider that is
controlled by the ZTRCKCR.CKSEL bit.   As the Coresight drivers do
not seem to care about the clock rate, I guess this is fine.

> +       { "zt", CPG_FRQCRB,  16 },
>         { "hp", CPG_FRQCRB,  4 },
>         { "hpp", CPG_FRQCRC, 20 },
>         { "usbp", CPG_FRQCRC, 16 },

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

