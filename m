Return-Path: <linux-renesas-soc+bounces-31420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG4GGkpC5mlutgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:12:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E670942DE5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B6B435D12B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18D83D7D9D;
	Mon, 20 Apr 2026 13:40:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245BE3921E7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692401; cv=none; b=FFRZRqG2G6+/jkIGA1Kvgzhk1SqypqaTSgDWfYVm41TPCVb3C4LmyFB64TnB7c3dA8u907pm9SvC/mQDIN5AVLykGN7OWhtxZWicja6rtqbisLmXSq59L6/ra+OZ0AeGu7OmPOqYOLWxPy9Ahyy4LIep3Cmc/BHC57KgQDyatiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692401; c=relaxed/simple;
	bh=cOlwDods3+RDyfVRhAhLNPWGpK0Yh6EZU0juYekUiho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEnzjlDEsF6lpjqomwefPiGtVJztdPdBrBZ5N4mYJEhYo1PSW9K7ynsrLMhNGGa8wFKWw781z2jh0T1f1SdKSOjfalJ4wKSku8J9ylKgoWGusp3EkmafNLh7fAqtmg3kDsimRiJleQZ/a0FeQ/VJizeaMmzUynon8kSAv30LQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6714fa8b955so5566551a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 06:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692398; x=1777297198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKax9YzIu6M6HTrqHFluRZuqCMKY5kOF7MhO6S3HLpA=;
        b=QEUY7/q+b1iD7x/b2hmSO8jXd0YZtnjxhmTNIDrYoat4Oict+RfttyJqxX/+0ZbO+W
         odwgiQ8Mbx6sjNyzQRs0/6toqjn/wUL5lhZqAcXxzXMVC46a7M+u25llQ5TgnRCOWTwq
         YN6/OxqBw2GgcirrV2/4wiZmy3lTE98UI5Tu+y8lVA8YNLHL7vKSUbol1tD71iWzDHA2
         DZIhZxD2sjnfwJm+Oy1oqWuRiXclS3QAOAQMwhW4+rHLQKUTj2eaLml4imUYWvAdrZQd
         uQ8nJR+q9Mnv2olvmiU2qEn0vOJwy9Mr5oHDNyvDYCLN1/e4jOcoiVbt/fhE+1BACi5g
         /YFg==
X-Forwarded-Encrypted: i=1; AFNElJ+cTce99UbeNtUqcLYmr8qV08+uAJomv5TQdjMQv8iBrU/L5PmWPmJvKSxRpBfponcxbwb9IhdtZQS5QQdlPDxMyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7lC2/rUoY/YWkqwJZJY6t+SZ0s4I7bHzc5QWJXxaMEhH3KJ4
	UAc5VGY5d/MYTzTxRSL+TYAbgvjT0y+wxaOpu+z9sg3UfA/KNdMEGeHBHytfYdQ75mA=
X-Gm-Gg: AeBDievtFLUyxHGRu9W24WphE/QLVFVBoCQJkLyAortxYqNOIVL6Bb/rSMQBdy1XiEW
	CrlE5U+x5gvaPk3fiH/OYJM2dDvMHWHJgZb095hmtR2u5ICWB2INMv5HVjDFhhxv6SvkgwtIdQq
	aaxTtvYf2CCqEEKrAk8GtiftJ92ROroKnW8eQEHbpDTv+oT5Zeu4LZw/ppAVhygQqhuhuz79PTV
	vj97icS9D/z2XUFh+83fjj3W9fMzdg+muryeX4AL6YrriZk0rb0tyt7rQ+QVy8kvOBTkLaBj2uw
	vgRJqzGovR3aWyKhjnOJDOfW7YzGq6B3746YeecfLATwc4wtWF3RzErNS6lehcMJZl3si5XYDbf
	eoMTp9BzOV1vviU/JoEjdZ1A5TMjzmjiEOt7pUkuL2LnKGYjP3OZLctSY8fJLrVWEtQsMTZ/nIJ
	2Nk8FV2/vPsCPnTTFIy8sqF0ckT3w4s+wdtGqt600FfdxuAyrCdWetX2Wtd3t4OCBhCbcB7SMGD
	P4xu+ul4Q==
X-Received: by 2002:a17:907:da16:b0:b9c:afde:9b59 with SMTP id a640c23a62f3a-ba41bad0086mr678721466b.8.1776692398150;
        Mon, 20 Apr 2026 06:39:58 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b694sm349735466b.29.2026.04.20.06.39.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 06:39:55 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b886fc047d5so563635666b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 06:39:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TTssOa2JCdbxocjObPKIts4KYmvYmIvbnMSuSB0uVwQRMHCv6ZPummKgOfKpWwaCpe+VNuc2VrBWTUQbbK7gqHQ==@vger.kernel.org
X-Received: by 2002:a17:907:9342:b0:b9d:e301:20db with SMTP id
 a640c23a62f3a-ba41de2e49amr637943266b.25.1776692395631; Mon, 20 Apr 2026
 06:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 15:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
X-Gm-Features: AQROBzAmjYSSdb5ADg_fg8teFvEbOwlE1BEHm3O6myg3QbwtkKt0POGfv4EoMeI
Message-ID: <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU
 port configuration
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-31420-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,0.0.0.0:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: E670942DE5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhkar,

On Mon, 20 Apr 2026 at 15:22, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The SoC dtsi already defines the du node with its ports hierarchy,
> including the du_out_rgb endpoint node under port@0. There is no need
> to redefine the entire ports/port@0 structure in the board-level dtsi.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> @@ -24,19 +24,10 @@ &du {
>         pinctrl-names = "default";
>
>         status = "okay";
> +};
>
> -       ports {
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -
> -               port@0 {
> -                       reg = <0>;
> -
> -                       du_out_rgb: endpoint {
> -                               remote-endpoint = <&adv7513_in>;
> -                       };
> -               };
> -       };
> +&du_out_rgb {
> +       remote-endpoint = <&adv7513_in>;
>  };
>
>  &ADV7513_PARENT_I2C {

Doesn't this introduce new DTC W=1 warnings?
Cfr. "[PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg"
https://lore.kernel.org/20260326042411.215241-1-marek.vasut+renesas@mailbox.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

