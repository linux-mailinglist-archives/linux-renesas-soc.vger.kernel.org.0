Return-Path: <linux-renesas-soc+bounces-33206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFv9OG7hFmo9uQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:19:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1EA5E4119
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 14:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CCC0300F191
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B31F3CB2C5;
	Wed, 27 May 2026 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iup0aUza"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026C33BB117
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884328; cv=pass; b=FtI7Ww4mzBgBWdEWVmjYSQlhlUkdB6Uj0K3MHRafw6+ug5VD01s2W42snFhOGz4FQ0dEGrW1Dn93sZfPxcmWc0d/VE/S8xUKkhcw66j3lck3md7C0zuFm6VG1clE/aRWoWtDj5V32ILDMUGSLFjB9mx9tBJQQQR81Rd90MKZTTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884328; c=relaxed/simple;
	bh=eunLwWZyeNP6y8RjCZ9qVFbItePsAKJFGFspcKcRlSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnYN6oIfwtUceIP0sOyeS4/gVfUKkZerh/FtE1tT6qsT4GBbe41UH20ZUQqFsLV9qL67CVWTKVuDvDX2JO1G5osZRDyaop2MoXnfFZFBZj2fv8ogXZNZwi7rZymucqCwxsFqJV4HeiBuaaGV6kO55sGkchrvMZqMS3H6kURz8bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iup0aUza; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4906238c62eso30742125e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 05:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779884325; cv=none;
        d=google.com; s=arc-20240605;
        b=iZQYoywGzHON/aQCrlG0MOyo7OQZ0jismsXPvaBcuUb/Bfec0ZlaA096MuGoZ5V190
         XWQaHIZb4z6iu3Myck4O7k2/G4m6qLF8/hQy5dTVkRZUWGUytyPfBOq+Sl/d2Sz+5fOg
         WUde/ZdnaDFNrkB4cj9NTwv8mWED1RDXrbsk3VkjbkImMfgHQ9+DVNLmWOaLbW72+98m
         FsczQehNIHb2kKKKU444ANHczhjuSFcFA1bPZQJQwttgPkyLi3j2/8eEDSxeDELkeugz
         N/1nGRNSCUm0EaKthtHPIbr0aiGJHH1YEVOq6QlhDRvTDwcmL8Tp+x8XjJgUlyI8deKt
         34ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pkxjcWbu9MZjjBxbwrKkIq+DQQqJ5ptkHwwdkN7jP4U=;
        fh=Z17AYa/bYHBSr1klv0eCoTgPOPVNVRbdv8ZA0vVqsko=;
        b=BuJ58ulmVK22ABXeUu9XCzgNtp74gDVzrgFiquidsgxJhTIJQwOZWIqZziSl7YfUIC
         riFj0ABKEraMuNQsoUs8rlO0AsEioCvD0TmD10h688ZjkW6LLxjMy5vu2UA5bdd0UNWK
         T3L40qJ2xekQDzvvmJgB8sBbi3kQ4e6nsNO2uy+jblt2dXm2+q8/ifawLRGxwlcvB6KL
         KcFVm0sKugNHJNBC8rCksf3fcYc96qx9IZ7z9Dqap39ebgFofTel4vxRjWUt9urluUX5
         HPX9Vx0z0gLHa4w7+uAqxbW3kz4V+Ljq3M6H2RqRiQMNwb/+b36TB21Zijo8lS/JWKTM
         /mtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884325; x=1780489125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkxjcWbu9MZjjBxbwrKkIq+DQQqJ5ptkHwwdkN7jP4U=;
        b=iup0aUza5Dxbcz6eyzcJ9cBFl/3Y0L2eNnEXatvKGNVMcETHdK7QmYTmB4Br0T0M52
         Lo9YgYeRDBwH7sV94LrwF+qJDv7PAJvF+0WnOAGJcaAUOQLeWuwXn6cjemMDmgvdBJJK
         DiehVJVKF7mwNYU0LaTis3pjtQsB7Iq0JuxI7DWraT1ha/rqTBrsQgetADW6IIQ/nNzr
         dlXGX+yLWfi6OfaTyVfPEs00Jiv4q/a/BIjOHHVavNwwiDnSo34PqrhLl0If4cnnijwY
         k24fCovl+npQqHdaz77GQ4E3U/vsAnI380GmllsIb/voJ/zrw5JQrfi/nLl2uGjfLXmM
         k50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884325; x=1780489125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pkxjcWbu9MZjjBxbwrKkIq+DQQqJ5ptkHwwdkN7jP4U=;
        b=qjxHxjEF0f0S9VwH/oASDxwWAZnZz5OojvhDNaNo9pfI8nQ77G3ap+tsWoeHztYgW5
         Fk0UzsvcVUCnJyYllO3gE7fy/K4dhKSplorhNbs1ThqR1FH9PdzdWq/8kGpylLO8puCp
         MHSspHLzGkMu/Q3nzfYoxuD7bsE+tMUIOxePp5+PZ9KGj2MwqYdru8s3aMKUyDPfqDJM
         gl8910kygZbUt8guNJkh9vdRwu3ej7ylBKhUdfTx0wHYuy9ta//qLzSd06SOxKxr0Nqi
         Pm7iJNn+o4U+NVsq3ZUtlTsBgGbNc9gDJzAPnU5tMvuZrvZDGBSrvorEXU6/H3eX1+BT
         z5ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4AjOdhSkDQFKx0mgUw5D20vu8i0kJSeetuqJj3c+q4Sy9eJkvcc+C2HJoMDPkoECXuU67NO4NO1L6P+ebsgJZXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyepst46WFfNPKZeWRtR6Ax1FOtV2EbLi/rX6t1qyFaD8k4y7XO
	LnmA1511Hk3Nxr/W3OQx12Y93XxVuh21/FwSe311eheoHedMYWO4yjHdXZuLCFYmj3TcAuPxPEl
	eUgaiyUpYgwADKLGaLZkydfGsyvxqUTY=
X-Gm-Gg: Acq92OFad5fI8DRi86I3FlWkw4UviWAMZlFBB45hfgCl14FZbkMiS309hm9Wv6y02Q+
	0vuD3YYMCRjJBqClLdLDx+2Tdb5+Eh9tsT4iLJgkgi3iAutFLjICiDLBFUravubXGPDz5K6+Wdh
	8gvXE3pLcFVsFEaaKEM536bDkiedvpdi75ZkuUN9IIKJ694kqUvcDhLxkTD0sEsB/9X3BSAz/5e
	+snCEagJpxOaxxCnwLCt9h5QrVGALf7xRUohzVBOsSZoJRgYdaowTZc8uC1SEUJRvk8rpEPuUCm
	79xd8EUgWFYtSNpEkJ1IXH4kytBStnnCatgStAOlsiUDLKoYnMURAz59agB0/WEg5eH4wHGS2HM
	eWXSCGQefM3iavRp/
X-Received: by 2002:a05:600c:4ecc:b0:490:3a07:c467 with SMTP id
 5b1f17b1804b1-490426cf642mr354995575e9.22.1779884324964; Wed, 27 May 2026
 05:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260505120153.680979-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXDvM1NoU0fi+9dGZWcEyEmfni_P7NH2o3V5rK-OiNjeA@mail.gmail.com>
In-Reply-To: <CAMuHMdXDvM1NoU0fi+9dGZWcEyEmfni_P7NH2o3V5rK-OiNjeA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 May 2026 13:18:18 +0100
X-Gm-Features: AVHnY4LEw9oHmwZWVib4bDP0uuax_0rVbkEiyBIIYgKqbHTFAWVr1VNFjySy3Pg
Message-ID: <CA+V-a8uLjFfPGOiq_ZxbzcY9JE3PsCHyHcx1dP8+=x-71cE--A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add xSPI nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33206-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,801c0000:email,0.0.0.3:email]
X-Rspamd-Queue-Id: 6F1EA5E4119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Wed, May 27, 2026 at 11:13=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 5 May 2026 at 14:02, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add xSPI (Expanded SPI) device nodes to the RZ/T2H (R9A09G077) SoC DTSI=
.
> > The RZ/T2H integrates two xSPI interfaces.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > @@ -1006,6 +1006,44 @@ mii_conv3: mii-conv@3 {
> >                         };
> >                 };
> >
> > +               xspi0: spi@801c0000 {
> > +                       compatible =3D "renesas,r9a09g077-xspi", "renes=
as,r9a09g047-xspi";
> > +                       reg =3D <0 0x801c0000 0 0x1000>,
> > +                             <0 0x40000000 0 0x10000000>;
> > +                       reg-names =3D "regs", "dirmap";
> > +                       interrupts =3D <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names =3D "pulse", "err_pulse";
> > +                       clocks =3D <&cpg CPG_MOD 4>,
> > +                                <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> > +                       clock-names =3D "ahb", "spi";
> > +                       resets =3D <&cpg 0x4>;
>
> 4
>
Ouch.
> > +                       reset-names =3D "hresetn";
> > +                       power-domains =3D <&cpg>;
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       status =3D "disabled";
> > +               };
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.2 with the above fixed.
>
Thank you for taking care of this (and also patch 2/3).

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

