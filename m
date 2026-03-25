Return-Path: <linux-renesas-soc+bounces-30209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI/lBxmuw2nAtAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:42:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953F3225FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A1DF30584F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645639C65F;
	Wed, 25 Mar 2026 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ouup2Y++"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B27439B95F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431764; cv=pass; b=PJLDZjri/BAdVRnzhHVu6dw9/14WldQijLBc19JPG5nLi4vvVQ3LuvekTCyyq4mkdx5Vjg3IMeD3oPKo+fCzyKkfm16Y4FhLZUozEqB7QXtP6/4M0kpPA+QZz1undAkn7HElSfZ8hSYHNX9ZkKC+njERY4oyScTINbw2lzRb2uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431764; c=relaxed/simple;
	bh=iB1MpeIq1U/rE6xcz0FTAu5KFzbYanQ/voAFz7+KWP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1wygOtprp/xqTioRuLpieH6WqDIT6VUs3qi7p4zptQANwaDfKmm9yLhCyvw8qknex8xOO+gSTzQa2dwO/ZENfwzhX6KdRvty5rhfWbMDCoq3G7J4HLzfVrbqzVPRTlmWZjsaOUymo6giT2qTufIDAaTNrxmqP+noSTd2HAHbqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ouup2Y++; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486507134e4so27093985e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 02:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431761; cv=none;
        d=google.com; s=arc-20240605;
        b=fagfcKMvwd+mSHExKhxCc6k1AS9mCmlTkqgjNL3nrpCrnR/qkmQQ3wfqiXPuZlaNG3
         nd1sHyWD2iI1jFOrq5Pxh9myv3vxeXbIxiKcekwPQTrYjPu+Ogpfn/+kIwdfnZNZOF1+
         rvQTPlGWlVx6JWP+arh4ACjA6HdSqIN8IXiwv1DVEEr7skdYGZ1OTGEUJ6GrIya3l6Nf
         Hdwo94Djv35d6QcXAVJuu26cEDXOgHQMMPAHaTFp3T1LEcRYQZ/tJf6OM41g+JkU7Ehd
         XIEmFn5noOTETh/D474sX8uDIrI5ZCjyNV8HIMmeyGF4AjJGold+K58wA15HqUk5E+LA
         j0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        fh=1B9W9D9VsF4E26tVCbclLn6y4igzle4GM0UJM8O62mA=;
        b=AjuKB+xw0N4wR4N5IceTu55HsIVorbILOs3KhH717jfXtI83CcKxzLgwrKSdTJi5Xh
         /Woi8NWG80Gm4Iaps08RxczJZINbd3GFjrdUA2tPiL8fR6jRKTjiMm3X3QfS/qBYc8wU
         WTR2elJHR5lAleCIrkAbqD8CPCCBIOulIrw3LwqCx3Vm9ljgf2AoP9F8vtg1TAfyQeO/
         j5iwIjVVD11h2FsX3BT/BPm+FSKRhdwszPMRhytHsbJaSX2ejTygQc145UGSM93mKsDh
         UwsNGNFt9ecJqeRccYUkluKpMPrFkB4nwKpqshX/g7HPP6SeSOXvky6ufD8SqvlV/8Cs
         k5WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431761; x=1775036561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        b=Ouup2Y++zGVJMKgkzqqkJVTiBroGJXZGaRx1oacMlnc1DUD+duQt4UkUtwnnheeGSz
         wNLmXJaRlfHDr9+3uPL33CUUkqyjYoZ7JJ14FH+SX7JocpFZ57nbknZe3tuKaxSmW+w3
         IlP4ysevRxc8K5ZsrjYA0n63ZaSKKGVW0okqOt4hVVxSFHsGmFiNRpGbPYE+RvB1fVDQ
         72/KCClSaQbWBB0II3difRnlxz8RX8g8tg3LzqynJ9CwnIbknADgVwLPT5vwiPGQuUpk
         vqTjNDeYJjjAncQ9E4KKEI7vfr1tB1hV4RM337KCEwdYanObrbNrZDHNKErcvlqVnyNw
         vN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431761; x=1775036561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8SmLIXQ3rCfuPKUyweZ8Jdf4VFN2OQAa6knDsMspLg=;
        b=b3P+kNZWUb8BW3shJfw0hPkAu+d7pq7ADK5Qmmu6dcZfqOVhNGqvlIif/I9CW/d+mO
         iMClhdseRBYPc6ARnXAnZfdsKg89TQKfI9cW0Cqh3YnAQ9tuZmwGA/qzJ//0QUdomnQY
         VfuTM9vZQKwVs17DO27qJTdQHbeDnORHeyqfcD0h8q7CR3oVScs3HG2YOK2mAlcX6wCk
         azxBLNt0QYl84kNGis1uFu4H0Vp9jAGL8xvbIjRQ+pCXTzysLhmU9VyA/CBWgxh91rLe
         ohAf6zOY9Eyw2VXQvWud8PO2tAkvYn3k8koGuQHyNJC3vUXhwdxDxsrincyj7YxzhIkL
         Fpcg==
X-Forwarded-Encrypted: i=1; AJvYcCXPfcnDVSgZoVuebytHq8uEHdFHAh1YN2B0+Oy9+7QIRfGzx95IKAF+UtxISa0kxwiRCRc/HxVIsObwH3HrzJrypA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+S/y+jUutlR02ZhIIo+kiZDRDdJfgL4lPGu75nPbF2sGMQojO
	6KrM89gsACRpNCVqv/W9kPcDQo0E3GFo/3MKSe3KGX6Hnf3vYKStsNiuZI+ulsBE8AxsfgsCs4I
	2TmPjZZweNEtcv6sn8bM9MtPDtnx53cg=
X-Gm-Gg: ATEYQzwN24Yprt+TpZHQiaMtXxTrcHLLPZtUXjBd9VHTn4JYT/gcu/pFLe1+wJiSgOF
	q4SF4629BVPImz0r2mj2WE7ZyrhSnegGem7Dgj/47ffFxtHVypouDbTXdKwidgeKfJP6siEl68/
	OIF89o4JdqCHeWw+PjVMe/p6BKKs8/ky9v1T5wKcN3jg8i0eWoBFYFwx26p0jrpUe3SXvZEeQri
	vRVbDoW90BL90b2E/LjHeS9pZVW6ljig9i8/OBgrnooStCEScLibOoFp7LVIhrkNjSoEMEY+u6a
	wA1TtFyeKwQS2Fezg+oYlvkYlgvtpCd5lDgoO2HIEHWANisW32dt8qo=
X-Received: by 2002:a05:600c:1394:b0:485:4388:348b with SMTP id
 5b1f17b1804b1-48715f0389dmr43148945e9.0.1774431760449; Wed, 25 Mar 2026
 02:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 09:42:14 +0000
X-Gm-Features: AQROBzAT47VIcwfqTpzGpASCq2Db9bAff5rSwNiFG5slkBrcAGVZoDPbA5Eb1t0
Message-ID: <CA+V-a8tDhStdSCkrvG7Bmrqci2CHscyd645B--XZaF_g4GsUuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30209-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.219.186.0:email,0.198.94.208:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,12c03000:email,11c00400:email,11c00800:email,0.198.93.64:email]
X-Rspamd-Queue-Id: 9953F3225FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:00=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
> cores and 1 CM33 core.
>
> While the user manual doesn't explicitly specify which cores
> should have access to particular watchdogs, it turns out that
> (similarly to the Renesas RZ/V2H(P)) it only makes sense for
> Linux to use WDT1.
>
> Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
> to make it compliant with the original design intent.
>
> This change is harmless as there are no users for the nodes
> being stripped out of this device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ----------------------
>  1 file changed, 30 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g056.dtsi
> index 9192c5bf7e59..40525470194e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -599,16 +599,6 @@ ostm7: timer@12c03000 {
>                         status =3D "disabled";
>                 };
>
> -               wdt0: watchdog@11c00400 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x11c00400 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4=
c>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x75>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
>                 wdt1: watchdog@14400000 {
>                         compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
>                         reg =3D <0 0x14400000 0 0x400>;
> @@ -619,26 +609,6 @@ wdt1: watchdog@14400000 {
>                         status =3D "disabled";
>                 };
>
> -               wdt2: watchdog@13000000 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x13000000 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x5=
0>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x77>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
> -               wdt3: watchdog@13000400 {
> -                       compatible =3D "renesas,r9a09g056-wdt", "renesas,=
r9a09g057-wdt";
> -                       reg =3D <0 0x13000400 0 0x400>;
> -                       clocks =3D <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x5=
2>;
> -                       clock-names =3D "pclk", "oscclk";
> -                       resets =3D <&cpg 0x78>;
> -                       power-domains =3D <&cpg>;
> -                       status =3D "disabled";
> -               };
> -
>                 rtc: rtc@11c00800 {
>                         compatible =3D "renesas,r9a09g056-rtca3", "renesa=
s,rz-rtca3";
>                         reg =3D <0 0x11c00800 0 0x400>;
> --
> 2.43.0
>
>

