Return-Path: <linux-renesas-soc+bounces-31421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF3yBrdC5mlutgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:13:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0442DEE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B959C30C1477
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEE02C15B0;
	Mon, 20 Apr 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j88NWleN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF12C08AB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692919; cv=pass; b=Y43He+xZZPUz0dne8s25/4yWRY2O8aM7tj5ww506wwaj9q/0N4ApZ6+SYImrLgZXo3pAGZcw4c169mpG4GUXMA0V2/UP5GGO2A9eEbtt4VX77iInl6/IGEYhOGT9YPGaeciT7nTPdY8sLKLy0TL9jKeXMZN2ylKu3/jaRl2RDp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692919; c=relaxed/simple;
	bh=00qy0pA8EbWjDRVQLMqGsEfviFdwGts50HbWo3F1CLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN08pBpzWpmW+1e5N3s5EcNfrb/MKmWV7ww1Gw1p516s3kmU3v6iRIIjU1zEGEop0MasjFPuqT0pYT4hqdOrFV/qFpDM54kNaJ/92eKoax5vDUIXzridsnfK8dqGAoAUbQKt4Vd764th1Duqvk2SszKtLHEfjPcd/zaEPfRPl0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j88NWleN; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so2166036f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 06:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776692917; cv=none;
        d=google.com; s=arc-20240605;
        b=KYky88u2Ppgzw5Af32mcBkTaalSBMvkQ8MVkkNLC/Oi4hFrv0tUuWxebMeZsmkDFNG
         Bo2XRf9rZMd5pBGjLlMzkTv10t8bLMOApdFcrgK+rR1EhP38XQYsye3rYKDIJUrVD6rK
         xerOtythsc1zUyRw2EBOwwitIOalGm6t2yWpaoFXeEu7eNL+uPxXZU4ABhDcfNDeiCod
         vJn3Ee1nyV8IIkA0uVySBpzx1DKYJVBHX6Bbx6JlmsBetHHx2UWS1k4xqBEDopbWOXyv
         PRD7lC98q5IC9b+/fPofLg7bnZWesMw8ER8MwvOBJyGZGM+gMRiF1qfNEhD9N8+8wFcr
         v2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fdvlGa138gGkO9+PnXwmk9qwHpQj31ZoGeBcux5NIY=;
        fh=wnNyJBJUDWJC2fy5aL0OZsZaM/m3MjcMe7jhYWwOMOo=;
        b=EK4gfo0v5V2WILu3mvGFisSZlJzQOmbKrNgNS9DZLrgiKFDYi/mmDrChPlIKk112AU
         QtL9/TDUZHiTUNfLilUuSrWHp7YORLXmthE8s1nb5CXPfahTWNHB9jEmHg7BcixaZbTp
         nCk4xV5e+kdtEYrTir8hFku2IHJJFKR8cKi24WTkNYeXuWGUhekUSS0P6/UclSoiLMRo
         hHxuv8jhDj8gB6KzX+ewm3aFH7unUzkMzqjQGlD3RMFmQaZamuioAJab6+YaUZjsPi3c
         aglRfhYYP62M/MaC2nxMON1KNfaYnnapeveBrnbPuLl6KuiVUiq2DJpSrhNplxPE+m2h
         9TWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776692917; x=1777297717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fdvlGa138gGkO9+PnXwmk9qwHpQj31ZoGeBcux5NIY=;
        b=j88NWleNgHVefSkWZq2QvXh+vYq8IVaCnIKW9/Jqsji/lbyvZeWp5XgZN3IYkTRYXL
         zJQASnjfXLBubIGu8DTxT9TvZM8HPOw3Hd4jl9tEv3vCFPfemNZd5+UYeFCC/a3ZAiUJ
         A2Lv6PW42tYkq0xf+tD8kde1/Z4JA9kntfxmmqafIvJQ1hvrB537QWH0VQ7QhdUWASMz
         WLcnrnhnNAGIgq1hOP9Jn040Kk6j53cQ6YJhfKLqmUeRvTUeOfu8NFU+fyniR/lWO4qr
         ZUCVVQPuG67MS4CNcMEhCWCvMwzEhJj9UFu2ncfyii3iR8Eod6TGdRnmK5hgPD97fNiT
         BeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692917; x=1777297717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6fdvlGa138gGkO9+PnXwmk9qwHpQj31ZoGeBcux5NIY=;
        b=b6xiLvt5HmsLnhIZdSQR93YBCvMgnUCaD8RWK50QRFRrJ9jaZjZTNV1DNxQ3g1sINH
         O6nkdYMY2Pnhhbe4w+NvTLnfFwytB0V0KTalXZGRjsXzfQyiLoBgYA24LYsfioeLL1J3
         q6PTN3DahzFUcoenjPVnav+DBIIlDRFSvd+Fjdhb0avB5FN6jBGG9/h7wrt+8FAIkK4W
         N/xKpmmWCmR0j5lhBRge26L+1MleML55cnJVPQNk+VIJi/k5vVIDaf32P4OglAvoh/5G
         xbpK/FHww7sKiBrkgO/re5D2WxgKlY/PiVWK6SEe/VkA0dSwIsFPGUwJLUpBCSwvBXY6
         yX7w==
X-Forwarded-Encrypted: i=1; AFNElJ91NrogI+MloQDsMYsoBcLr5DXLjS56SMvQ+XdbUoWvmgKJ2GqNTj0mI4y3nFHhB9JKzl9PTuztFv/FeWMnDPdm6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxN7hiKzoKQZYgCxspe5ILChHxrJTLbzuJXiRFkPtHJWltXlPp
	T/QMxAheeSqDEkEaZEgWHB1yjMa6a8+dPKVoN1qGpKrh9uaCt2UkMLak1sT7GaxggclzWpMLaIo
	9pAT91nItzFT1eyKtH3mKJH44/gesvjY=
X-Gm-Gg: AeBDiesib0OggVIg1/67QUPgZe1n7izCn820lJowurKtGUkS6kSZsjaOA5S53HqbZUJ
	WF1XgPcZfRt+TFyYCvgmsHPhWl0kbi0vu+xieGNgA5Nq/YT1Qel+yiZl4eevyauiH9dRfxyFU2b
	Vxja/tmsTsnay+gQz2RIOYgTvrh9u4HrU+hpaudXWe015zCW+L1cXw7lw+/N7GpgFRDzT6+06/g
	mdMpJb2+7o/osMdVdaxAIfTXf4AVsWJz9iNOPPvmXJex29SAxBBjvxxDFNBcaOLiFFnipDQTc3p
	hREhnbM/eBvqefG+g/YBTfCEOLdO3EZAK4JlyRMhVmI4ti7zZ3pCu/J8iBEHrsHk5MAU0c62kM1
	dTYFL7tKvg9c7
X-Received: by 2002:a05:6000:471c:b0:43d:c06:bcd7 with SMTP id
 ffacd0b85a97d-43fe4094d83mr16883876f8f.26.1776692916474; Mon, 20 Apr 2026
 06:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
In-Reply-To: <CAMuHMdX06K5TzAWZv_Ehec2Am-P0Q-3cchc6XiOgAk6Q-W3BYg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Apr 2026 14:48:10 +0100
X-Gm-Features: AQROBzCiOVQ_TyjQ6mfvdYKiI575mtQ4yGaivSUuNalL12EzefxadWqsHgOlAdA
Message-ID: <CA+V-a8s8DGd-t8+r1jgBr9j3BqJEx-ZkaZoUVQMzFyVS73KLgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU
 port configuration
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31421-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.048];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 69C0442DEE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On Mon, Apr 20, 2026 at 2:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhkar,
>
> On Mon, 20 Apr 2026 at 15:22, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SoC dtsi already defines the du node with its ports hierarchy,
> > including the du_out_rgb endpoint node under port@0. There is no need
> > to redefine the entire ports/port@0 structure in the board-level dtsi.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
> > @@ -24,19 +24,10 @@ &du {
> >         pinctrl-names =3D "default";
> >
> >         status =3D "okay";
> > +};
> >
> > -       ports {
> > -               #address-cells =3D <1>;
> > -               #size-cells =3D <0>;
> > -
> > -               port@0 {
> > -                       reg =3D <0>;
> > -
> > -                       du_out_rgb: endpoint {
> > -                               remote-endpoint =3D <&adv7513_in>;
> > -                       };
> > -               };
> > -       };
> > +&du_out_rgb {
> > +       remote-endpoint =3D <&adv7513_in>;
> >  };
> >
> >  &ADV7513_PARENT_I2C {
>
> Doesn't this introduce new DTC W=3D1 warnings?
> Cfr. "[PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg"
> https://lore.kernel.org/20260326042411.215241-1-marek.vasut+renesas@mailb=
ox.org/
>
No it does not introduce new warnings (logs [1]) as the SoC DTSI
already has the missing cells and reg properties [2].

[1] https://gist.github.com/prabhakarlad/69f53e32faee17ead390c9ed68c322d3
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi?h=3Dnext-20260420#n169

Cheers,
Prabhakar

