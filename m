Return-Path: <linux-renesas-soc+bounces-32625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGBkFszGBWrDbAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:57:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285B542054
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C20C23008614
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E24275B15;
	Thu, 14 May 2026 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd5ZrFwm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C23128DF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763444; cv=pass; b=J4MCjRQvmpbGdE0JAZrN+iZ8oqhlxIqi6mvOOyOTZYFi0TC6XqEBlLw+HFzeE9Ng+SJx9XF+Oky4TaeuMGtEkXxw9Jj2kH7n+yJLgQonJzWdFBhlw5cSvsnCESW3xNsswfssWCiBkEu6weDKnCcO11qGJaU6wDMVWRB6HihC9lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763444; c=relaxed/simple;
	bh=65EU+LT8ShoHnvOp3wnA17Kkc/vTm6Ghc+27Z8+Oepk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bjfxg/nT/AdC6b4xDo2qkH3QdnwbBRY7iM8b7DwvmDU1Sek+DJCuBK/T4iNvJBMq9uHDZWptUEbb217hQkXAFlOKeu2jTHYNz23xwHlcm0bCRhg+W9fRQuUjA6l7s/CtfIOsu/n9yXmuONfwniCFMnpT9UStHzZdaYxcyxORi8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd5ZrFwm; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-459bf19e87bso2735193f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 05:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778763442; cv=none;
        d=google.com; s=arc-20240605;
        b=lrJVvbVQQiB4of1M6PPYpcMlUKnM8OV9aA+pnbSXvg9fWDUb9ySkqSPyRQFwKOHpKS
         3iFWTdaDRDuhl0y/ZIJUrBfCIXTA8Fz0BbkpT+g70aL6Q49r2x4601f7NgvCHm4KJoQ8
         0X5kUo3VzchPltyEKl84IO8EptYJpKrBu3/1fwZB77zHaYGDXrX6uags0iNwpAONwknJ
         rdLLieDAzmxkjM9mALMTOaiXgPNdTmLWGliq/iG6FytJWRhCRsFoxAEoy2QYHSDpbZw1
         BotAVA9LyBRXOtQZZIwbvs+pBFYhutMU2QB886ofoJGZbavB5asFZlvgUNqENo4IMGGe
         fPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJj2MCOLAauZByFtae0gIhlDdGWCUi3MspOPavj+fQw=;
        fh=gmSjlZg15zu+bEuywU6dW3i85VhZmCZkPdTy/Qts7Qc=;
        b=g1HhmEZ5KQoOCGlg/8r1xUtrWM+41oYOKV6RYE2oSFPu1Llbm1o9D82YghOXMbX+uJ
         7A1/SWdX1U41fE98+GsVJRLeKeSEmBj1/ksvDCkhZAvgB0AHg1WYZJqHx2/gMCFetCQh
         z39oaXuWDEUUK6IG/nMQosHFHMbCGj0h2ZWEvKHjzuccpSRv3dH5EsXUHCUklBw0Ys8+
         ELNPIQNxE4qndIziLNCyw3dQJMXA22ZcMIe93z6q/WSz9GzPX84UWtYsJ8s0TVImkMsG
         vqFuBhX2AB9/Lj33t8+fEtoGTWLWYp+g1xuPVI9hxr8f8l5UO3PYWOqiC0bzWYumbLWG
         zWnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778763442; x=1779368242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJj2MCOLAauZByFtae0gIhlDdGWCUi3MspOPavj+fQw=;
        b=gd5ZrFwmg2xTcFu+udU30MCNLardFOjCl3U6RXYlP+53ythCl3twul4lswSUzxObW2
         YsPwgto5RKKUtynnqm4F56hqLZwzypHDrW3O7Fq0d/POtOGm5tmw26STmSsldxaFSGlW
         XmVd2uBkNlOkS+p/a+KNj+EHmoB39W7HVE5ZfvfIa+Rf8gI9ODmC/q2F+YidqOBZfQJ1
         U0l+K/S1zPC17wla8FOm/ttGx+cBwDLzHLaqz06HIHeEFl7zVD1Kktyc7aX0mKxXVIWZ
         7IdpH0xYYKExxWEX+HqAylwOvXw/gjxjg7QY+WOSPL1Y2M/4XPpRkUA21DGtOw1YI7VL
         dnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763442; x=1779368242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJj2MCOLAauZByFtae0gIhlDdGWCUi3MspOPavj+fQw=;
        b=CvaQN+ZncL+9NUjOUsLoiY1jc3ae5rNtVTrMNRGHYWL3+IhAnupFm7ty3TNh5kJiPO
         4vljJZDb2gXMJJTerXKKtdsxSNmkXrEssL1TleXsyZ3hiXtOXa9+jc8ynZ4H3AV4PXh0
         JA8Lu8Sru0Fl2XXT0QgOdLKIQ/MXO2sUeZQWpFAYC3pkrrx6CAai0zWRYbQvcvlgHurE
         dlcW3GEri+vuyoqpb1LO+qYBvfnGQOGf0hf5SUqtccjCaRK3tL3Wcc3id7PX8r4qYog6
         k88AKxIUOoBWQJYS7pplucudJFFDSyyz13TGbV04AmXQ59T2ilMj0CeNxfUA7wIeKCfH
         K/5w==
X-Forwarded-Encrypted: i=1; AFNElJ/qOmfCkL9h36ic4Mci4JqAYuQbZpeM1hQZKMMA/6CqIAvn0gdcItEtt1uLn+9vkzLaE9mmdeXjnsgoEZTe5nwZ/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxgZpeSY1tpZrJlkxOpVVJY3vgMB9v1qZ9XNNSVLEAgElt/iHz
	gzSv5kj+41scqW+DJNd7lkzKPiVgLJSlcfM8PCOtmBgxTvX3cd9PA0A0KddoOBSYQ9f+ty1HdVO
	0PwsfRUlfkGYMLiCV9m59sGc2Voo/0MU=
X-Gm-Gg: Acq92OHgFD+ss6vIedZe+t/1lDjyoGW50Z5ht8h/vmAhrqvGN0gsu16Y9nDvM/jkgSQ
	wWqpEmzYDS+6jTGunO6GQxG09C2FcLnA9VK6JnHZayVu3Bu3GOAYPEDpS43fV10S9RLE1epMrif
	zc7gA3iI3fuEcY5uMgmd1jdEt1pvOKGKvslOBhalx3d8nunJxD/S+Ik0iywUP22oWp7VPQG2TKM
	IEeISiBhv2RyKesFm2xZcd95Eo/Ib0pSX/imldH6FwCrw3iR/T/ZfQ0RoSMFN+4XsD/Y2W1ntkX
	OcYAa3E/WA3UbvraEfhVOX4Zx1DDmQZhMK0Is4uYqL8Av7avaCpgjp++sK5pwf5afA+Zsw==
X-Received: by 2002:a5d:5d85:0:b0:43d:6787:9934 with SMTP id
 ffacd0b85a97d-45c580ce1fdmr12148663f8f.9.1778763441512; Thu, 14 May 2026
 05:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260512144104.761531-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513230208.GB291825@killaraus.ideasonboard.com>
In-Reply-To: <20260513230208.GB291825@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 14 May 2026 13:56:54 +0100
X-Gm-Features: AVHnY4KbiOjn7p6OgTwUEPB8jMaJXzcFxbR1snrUWBRJrF42n-t6aSXedmu1OB0
Message-ID: <CA+V-a8sqeio7K1f4MYWVSP5rvq89fzcVhnZL_jFZRz__FhG4cQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm: renesas: rz-du: Move mode_valid logic to
 per-output clock limits
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6285B542054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32625-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,lists.freedesktop.org,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Laurent,

Thank you for the review.

On Thu, May 14, 2026 at 12:02=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, May 12, 2026 at 03:41:03PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move pixel clock validation from a fixed encoder check to per-output
> > constraints stored in rzg2l_du_output_routing.
> >
> > Previously, rzg2l_du_encoder_mode_valid() applied a hard-coded 83.5 MHz
> > upper limit specifically for DPAD0. This approach cannot scale across t=
he
> > RZ DU family because pixel clock limits vary per SoC and per output
> > interface.
> >
> > Add mode_clock_min and mode_clock_max fields to rzg2l_du_output_routing
> > so that clock constraints are expressed at the granularity of individua=
l
> > output interfaces rather than globally per SoC. Update
> > rzg2l_du_encoder_mode_valid() to look up the routing entry for the acti=
ve
> > output and return MODE_CLOCK_LOW or MODE_CLOCK_HIGH when the pixel cloc=
k
> > falls outside the declared range. A value of 0 for either field means n=
o
> > bound is enforced in that direction.
> >
> > Set the DPAD0 pixel clock limits for RZ/G2UL (R9A07G043U) to 20.875 MHz
> > minimum and 83.5 MHz maximum. RZ/G2L and RZ/G2LC (R9A07G044) share the
> > same DPAD0 pixel clock limits.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Moved clock limits from device_info to output_routing to allow
> >   per-output constraints.
>
> Given that the DU has a single output, connected to multiple encoders,
> is the clock frequency limitation really a *per-output* property of the
> DU ? Clock constraints coming from encoders can be expressed in the
> respective bridge drivers (and the DSI encoder driver does so already).
>
For SoCs supporting DSI + DPI, the clock ranges vary for these
interfaces. For the DSI this is handled by the DSI encoder drivers,
but for DPI we must perform this check in the DU driver. Therefore, I
chose an approach involving a per-output clock range check.

Cheers,
Prabhakar

