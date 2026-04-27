Return-Path: <linux-renesas-soc+bounces-31679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMagC1BL72lO/wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:41:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1819471E16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012793036743
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C830130F548;
	Mon, 27 Apr 2026 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7BIkgQe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E730BBB9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289842; cv=pass; b=cFeaUPA/g+sGQoqqmu/pF4Xh1zBjH7/BEaQieZYHoxoAvQG4azhG7Ft5pYEOGpLXHisbonqSf0spbAYJgQtSogURJNE7pGH8DTk3BEQNgIB55fN6FXaBG2vFVVR9wcTiPWtcdaI36uYdH5ysDjvi3kjZXnFj7GRe0ruzx+Af3D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289842; c=relaxed/simple;
	bh=DTsJEMz27mGhltz2uNUeu19Km3GSxzZ5FHM7h/My/oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upr0RxNskYobBGby/VkAZN25CdU2UdpKJT7gZ9WIM46n5ZyQ3uBgFq+VgCh8Jpv+k8rQ3ymZqEDgdeq+CbOQS4NoBE1gEhC4iq7u0ID147C5niVi/vnmT5wGqEo62qdr25IUrk0wnAZEtekoQO53fFc30L38cfRzhKR3d3o5lE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7BIkgQe; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so125602505e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 04:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777289840; cv=none;
        d=google.com; s=arc-20240605;
        b=liUhDLOeUDv4CGY07LwccBPePzTP5Bfo8z6b1d//+LCHSYQOXQLylWNvQ3TqhHJjRx
         Qxb9qu0G9HKw43quIU/iBGQ7QJ3TsJ95e3xH53zdr7kyKcPiX7RjfMhfOcBVvDyyt29L
         rxkqCWyCE71cSGJBKRfDY8LwvyMcljN4oQhE+xSz29YZ/AclqRVqiMMk3gpzYeYCdDuZ
         9jXfzlaErrcMJm/iZSHYywqEdloDMWn45sdqdZN3rOqKFhoxffVFq3VL6OOFwFxLKcc6
         Bm6OwhPerejsil2axV5SwyFFfAExtnK/BP+AxWRWZLMum9gsKPgwLMgorqT5ksr/84LQ
         25VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ggb5lc0jF2Wl6dmSNxpjNYGRULrbBBGGzqHcz78+7nY=;
        fh=bJd1seDKLZELrf/8EvtUetjNKLXhyk4lzmrs/oK9xbc=;
        b=ejLL/+4lWt4y9d1kToOVxpn3Si7jc9r+DtcMOOooKEvLgz0pFyE3Fg9gEZxYqOqVja
         tQfNTnyadyhxm1Ta/mBtwrjRc9yD2uw52bJ77ZwPJ1LoeO03MJzYD3mlYB8YGJWfDLtv
         KW4DWUhJ/4SzU3Nkm5WQBhTRpia4tLqRVO354CjQr3S3uUhgde+6wWTcwBILMFaFpDDO
         b/fjr2v12G7A6zETyvHw/AMrKiJUo9fhnOqCGYPGyPP9XRZu4FaDqKmglU9BvEdARFud
         jVYMHsaAOkHPmtFNPLEoHx6Aa/6TXZWQyHKIxiRqNrI72tOb3m8bYSK6gygF8brwMkZc
         /dkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289840; x=1777894640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggb5lc0jF2Wl6dmSNxpjNYGRULrbBBGGzqHcz78+7nY=;
        b=r7BIkgQeED+I5YBhn1x1BzJVmthgj1Q9azEvaTIH73m9Ri3WM8z5i5qfaIdNSBOsBq
         9ZgGtxpMuceWj3RnFSCMMF+WyaA8svx7W91Ta6hqi11Y8XPHclY8m+oIikxhNsfJkMXA
         AQoZ6fEjaUKUY7uAjlRax3n72hIIcZyHHcVKS8Tj/gwy8Zo5F2TOQT1fakq1tSWOJUM3
         U8WRfxh91SvwB1/woNWK3R/4RbJrNSVJxp7ppX8MqGc/6cimUeOJcMMh8OgUEsl4NFbd
         SWuJzfbv1MypE/c/P3eicTjCfFdVVB3vBqBO7rsbym+GBBMV+XMHKKAuhlE2ZBrEnC6U
         OX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289840; x=1777894640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ggb5lc0jF2Wl6dmSNxpjNYGRULrbBBGGzqHcz78+7nY=;
        b=jL9Gwtqn43CVVk4GsYK2rFzphhquOA/6HxZhA35XMdAunbM3QjPx+zLl3AWQqnozNz
         MatEtWbcKjmebGa2Rnz4lj08SNy8DwusGw5cVqIMi0mIxLUvjlBwZAuvp+Mz+rzx7SXc
         ENsMHHJv3JW7xXhvGSMoZk59SHOL8UxT4XwjMg9OwT92CU8SsKs9z0cHKVeQaL6m1q6N
         70mi7DkooHeGC6lUt8fgcbmHTIzZmTpkZ8POCuqCpySq5ww6zuN4pRgsxLq2X3QMLUxL
         7aAdNyl5ShlVvFeD/akFkE2Vdiv34HA4UbwsYOIXYCeunBz/3R/TTfEhyjUFsOq+k1of
         59GA==
X-Forwarded-Encrypted: i=1; AFNElJ9in+z62GLrotb+82ICMBoRdrwb/7IJbImsknRk/UHHzWoswJWbnws9ex1hrMffcp6hu+tlHXFpxDG+Q5XA5yDhTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJLZdhVFMu8BKt/eRSP9u5tURwDyiUvTFxeP7zP9Kpbeiy7GW+
	3XsUFyo2iA5Ge4ZrKPqDYinT9R/G3e+GYIm4y1uiQ2s29jbwg3S0YKzk9cQWbWrclREnaBheoZt
	gCtX6lonF92T8r+O4mVuJOX35k8Wlybs=
X-Gm-Gg: AeBDieteCUez7VLhB1il11t5OA1dELTnL/9sjoHdr6ZjdtplNhP3TB18lujrPZ/X6KB
	xHgbD3PTB3vQTQi81pBgPnQ+HYvNK4C485b/5huxUYHrMpqtqurme8zR8HS9atoOPL9C8qPzJMk
	spYxT4ceoFQBQwK8RHZATfhM29OXkaau9AvFjL8Ab6VesC5jctBayhs09nmabYOPnWTFREWvpmX
	DSySdF/6dKbs7tmsGggXjqNNXMd1Ixb2JDT0g4185rUAsfuSl2+U9WH1b+cx13OihHCnm5GYhbc
	rA8X9OphA8YrHeWAIMpS9BiWrUIHH4oqELIG2Z656AzxCX4dd47y98VhBmxM3XUP511IfWoXCV7
	JZFM=
X-Received: by 2002:a05:600c:899:b0:489:1a63:509c with SMTP id
 5b1f17b1804b1-4891a635125mr300177175e9.0.1777289839620; Mon, 27 Apr 2026
 04:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Apr 2026 12:36:53 +0100
X-Gm-Features: AVHnY4L8-24eDATH5JOJjKbBembALKWoNyY05D17sZdfSTDKMMYzrFglELjP3cU
Message-ID: <CA+V-a8uLT-7T_FNqPS4o+zkhAv312bM_qhbq-5dOveBSUBPJ-A@mail.gmail.com>
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS
 detection logic
To: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Pavel Machek <pavel@nabladev.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A1819471E16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31679-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[renesas.com,nabladev.com,gmail.com,glider.be,linaro.org,vger.kernel.org,lists.infradead.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Vinod,

On Wed, Mar 25, 2026 at 11:20=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Read USB2_ADPCTRL once in rcar_gen3_check_id() instead of issuing
> multiple MMIO reads, and derive both IDDIG and VBUSVALID from the same
> value.
>
> Drop the redundant !! operator, as assigning a masked u32 value to a
> bool already performs the required normalization. Simplify the logic by
> comparing the ID and VBUS status directly, which is equivalent to the
> previous conditional but easier to follow.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/acJVCOdlchLiSe5n@duo.ucw.cz/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Rebased on top of latest next-20260324
> - Combined variable declarations and assignments and dropped
>   redundant !! operator
> - Updated commit message
> - Corrected the link for closes tag
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 79e820e2fe55..9a45d840efeb 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -314,13 +314,11 @@ static void rcar_gen3_init_from_a_peri_to_a_host(st=
ruct rcar_gen3_chan *ch)
>  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
>  {
>         if (ch->phy_data->vblvl_ctrl) {
> -               bool vbus_valid;
> -               bool device;
> +               u32 val =3D readl(ch->base + USB2_ADPCTRL);
> +               bool vbus_valid =3D val & USB2_ADPCTRL_VBUSVALID;
> +               bool device =3D val & USB2_ADPCTRL_IDDIG;
>
> -               device =3D !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCT=
RL_IDDIG);
> -               vbus_valid =3D !!(readl(ch->base + USB2_ADPCTRL) & USB2_A=
DPCTRL_VBUSVALID);
> -
> -               return vbus_valid ? device : !device;
> +               return device =3D=3D vbus_valid;
>         }
>
>         if (!ch->uses_otg_pins)
> --
> 2.53.0
>

