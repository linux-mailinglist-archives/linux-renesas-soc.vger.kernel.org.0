Return-Path: <linux-renesas-soc+bounces-30676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAWuIhrezGm0XAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:58:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDA3772D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EF813072384
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 08:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C45382F07;
	Wed,  1 Apr 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjLqlUZo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37536EAA8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033848; cv=pass; b=ctVEMfOhmiTT2aDfSqtd5OQWPWWxLGKVhz+Y1kc5RT7N9xAxsGNJ4QCcWbqSp0IzAsDn6LDCzWyywnoRUVDZdKQ9eW7RDryR2pK6sKB/9YGeS3OUdjh/vvn9OiyDPel36vbq7BzzzTWNfGH7T1QUgFbmpC2FKj6vYfLC0aQrDQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033848; c=relaxed/simple;
	bh=rjQpwZRziCRPmRDpVCXivkM3ZO4+0gIi2WpOJTzkNQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gesOq39qRemvuUzSOyTk7bbEavFYNenMKPK8Hed6SI96QXFPmNSUnnTFmaVaj3WmbuivkpCyY/AmtT+xnUIQQxAaiIlgVVgc3Mpei84nhY/9gTBXFBQRKMtB/VHUDoXvs+zk4PTHkU+kI1bFhJaL2oIDszWSQP9+tDxYeAytKvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjLqlUZo; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b87970468so5812467f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 01:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775033844; cv=none;
        d=google.com; s=arc-20240605;
        b=htMgnfsk3g46CP9dGeL3G1dqwAd0OfV64qM2Ir103IFCLgDvYA202lMVGSepp3KSX+
         SrgfpbRy08C3sPZAIfr8+98dOWUPvb43SCbOU0bLpa90i2h+vtnV9VWqOE/BFk81NbQ8
         nzbUkNRRbDvRn4+SFyzZjgXWhTd8Zq/doAiig15Xii12BVg3D22jJsy8QfzVkv4gfQIb
         kWTLD+tf8BiKPJ/8FucGKJs6VWDlEwYU5keXOcQcTehh2rpOKwJKwmN/+Fkj4NQaBilH
         dx6pcY+ve6YdqK9yD9UNHt+2jG5qoSZvNcHjjb6e0d0gXcqFuYh18BvFHUOAeAifvqq5
         ibqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mw8Legef/6oXHTECNzM5IKKB8uISInWRQbT3/G6OOAs=;
        fh=RpKBoPNh11yB7ZIDhqXKciif1woC6xnYoapD7dEJgw4=;
        b=BS7qCP6iYl3k8nJZzBt6/jOnJiH1KcodWQdBXrVyWxBllRYNbixHkoF22iv1EDaWI3
         FALFjTl20J+pW3II0BPv26+rJiutJpCQjt+2byxFuR9PZpfiKGGfwaoE4ytyUKorQPI0
         Sm2BtMx3YlYbcE2Xc8+V4jdwTnKxqb8+gM3MxAhS/K7GlSUx9Z1Hs73FfA76WQ2qqlo9
         NmWyRiNkZv5qN58EkETp5uZn+vEMX/AXmQmCHbTy0RgVnlxg3HoEjTpkDZ8J/NHLwuoO
         J3TgMMCGYYCQiQarzuRRhe+lWBM/8MIobkBo6S426AzHRvZpu+bGQaAUpTkWg2tztk08
         L5+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033844; x=1775638644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw8Legef/6oXHTECNzM5IKKB8uISInWRQbT3/G6OOAs=;
        b=BjLqlUZo2/XDt3WU5+gWyV+0jGGgAub4sfJjeNDbTBi2USzFCzM4oOuE77l95KkObv
         qaMSt+kry3l/YwDIvtjgYWOenU+919RK1GutkWrKIebG9M8uCXQQLrP7ad6Bh33WtQ8j
         jUJKXuve5qCXPo5rejtUL9E5CMG316k4i3/YPkvx0W4oIB0IOKGPHSYjxW3+EJoVeSH2
         xf2nPZwIf+rJ5WfQ7igIju+EaGQQhKZWL9+zGdZ5uqpD0tvymvDfi2eLFMHbAp6Vwqjy
         fYRkEvjyKvXNyAz1huQKxJBTlWXiW0pZpStjhZBwIjGszSMMmWm/vwGROD+2dtNv8N+L
         cBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033844; x=1775638644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mw8Legef/6oXHTECNzM5IKKB8uISInWRQbT3/G6OOAs=;
        b=YD3LzSDS0GXNuuG8cbT2SyZDaIHTQLDbgUOH+nGoqYyxrkjQzU0kaI6bOCvodRtDYm
         pzCJlZsDU7/q9HI/ijeHjChokKKg3FcOE9NqrLbO+m3ROO0wIvj70r1KffdgTXrOKZgL
         maqQFIgrkKfG6l58i4z4g6Zz9wwDpsUIS7zpVnffBFX5jAwGhHWHtua5iTGtJt+nHGNU
         mvLQ+Q65wYPBf8Y5whXzkg4Kq50WAXu03YNvWEDw+Ux3yme0QYHpepYhLFF8jTLJY8yz
         6tPR5LCx4KuJsl7ARIkXzcw9XRCvGMCwS31E/KvH04/7c2fGeFvgQuJxcl2JnRxnZocB
         XKbA==
X-Forwarded-Encrypted: i=1; AJvYcCVQvdVdZGISyazZRbVNxn9Mjlybag6kOOOgfRQtDMnyAVT1S2r9lMXCLw7nAXQF5BIMnd5h9PPT6rFQcHmEA0KY5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf8vaFP6ysOW0GTyfacI89fG/AsAJ95aSR5F0nqDuxG6yKntDJ
	5+lCKxM2oTjWJO1zqDp0tA4ICaNg4XAMXM3xeRvjSwznd/Zb3ReEExFTPk/iwF9lm7hc4FfpFlo
	hTjLzAEG2fO9iuh45XedZuNNVIhAXIgM=
X-Gm-Gg: ATEYQzy5xc3tvC3U172e/gec3lo0g1wGyys/U3984UbTvylLUfV5PTPUM9hjfp53uRR
	mxf4LWxaCXbU2VfgQe5L/WkQal64LzO2j1XawRV5aVVAngIkqP2K2lWPR5czHsjpUGt8bqC+k2w
	ZLzL1xCYmmL5JgRjw5bSwLHhNLFdre5y5UI7ddQpXBwJtCjViIabjZ4tOYHBx6++f6LsMcQZ6o6
	2tXcrsjKhzhzsOtsh+shpmNstQHU1hNBO5CnsZJFSpVVA/lcG4plan026lLZRv84ePCHwCsLWtY
	aQLGKDWiOWeWUgmBTzUeRkT53k70qA8MMerLb03Cw4TnNh9UdhziWHV7g7fnScDqSGWvOg==
X-Received: by 2002:a05:6000:2884:b0:43b:54c9:85f4 with SMTP id
 ffacd0b85a97d-43d150f6e25mr5076402f8f.39.1775033844230; Wed, 01 Apr 2026
 01:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Apr 2026 09:56:57 +0100
X-Gm-Features: AQROBzAJgb8y5bTEYQ31GU2eMYziS2ngz4zh_iuUgAJ7c9zmcODAjNpYWf5OEdg
Message-ID: <CA+V-a8ummyBKq4JN=YGG=k5_avKGjRYP1hcG8yARp_j2p62Gvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30676-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49EDA3772D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 3:55=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H state
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: fast
> * Other SDn_* pins: drive strength: High, slew rate: fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 54 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index f87c2492f414..3fae950db603 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -275,12 +275,28 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0=
_DATA5 */
>                                  <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0=
_DATA6 */
>                                  <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0=
_DATA7 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>
> -               ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> -                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0=
_RST# */
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               cmd-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* S=
D0_CMD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               rst-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
>                 };
>         };
>
> @@ -299,12 +315,23 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
>                                  <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>
> @@ -323,12 +350,23 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* S=
D1_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* S=
D1_CLK */
> -                                <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
>                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>  };
> --
> 2.34.1
>
>

