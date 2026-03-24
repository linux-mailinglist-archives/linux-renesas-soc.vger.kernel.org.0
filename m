Return-Path: <linux-renesas-soc+bounces-30168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK8RADmCwmlneQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:23:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A9308244
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4977430C9FE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60FB3F65F2;
	Tue, 24 Mar 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiA4QGGu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D33F54B9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354719; cv=pass; b=jihGuTTnic0SvthozsPZAm8HA3MNMz8Xhu+7mS0+pFepeC1kd75wvWU6ISZkL+N9insaxdPVemPzFx0u9+byUKumAXftKj0ZLSuuPqvKcWW4fOITxjH7tX23n6cGuE1x1AQ0uKbUB8HMndDdCcq/uEiXneO/PFFac9qK1qYaLx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354719; c=relaxed/simple;
	bh=QxEuLOp4xC2eZw18lsPki8VzBGwyaM4MJgqBUAEFTC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fW/FLOIAwqXdI1NkuS42Mz/9DM6YJo0OlEJrZT1MMe5FoWHs9g26ZeM5AQVGSpEBCsKnnQq/LIMhdhhyr9a38qxeQ+tROu2kXQo5/aEwwbAPtClfPA+eH7kY4I7zpIObFwcJN51N/b1pxLStjnHa+InN8ZtuQ7yNO83kd+W3rWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiA4QGGu; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so4830886f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 05:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774354717; cv=none;
        d=google.com; s=arc-20240605;
        b=C3Wwee2gY93uvKIC5fYBsBuaKldaOpkg5b7lhK1TDR2ECpGSSUpflKdfulqusVSlM4
         /QCdWU0mYXtxvEs9cMckAocdnB1/3jKJqFbtblxaZJwXSxafJkctrNP0SZIkyYhZuXAN
         Jj8QDFPF+y5FaTG1ejZziC64teAa+Iz3UbKrJ0LUdfquP5ky6Cg4xKd3moqVG7P8KOrk
         AEwKUfEUnwb3w0vX3CkP72Jcnuqoi4Lbm+elw0aV/dJz9aFfkxC2lpzzut6t6FotoPZm
         B1muM/jBz9jmDp45SOezQxeh2oLfnEZa6IQ+GkPYqrZl/GNQHek+MK0e6r1kcjFf/R2a
         f+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QxEuLOp4xC2eZw18lsPki8VzBGwyaM4MJgqBUAEFTC0=;
        fh=G3GvznxpFfHS/MLrKyKNnXKZW/JcaS0/l88JlssKsx4=;
        b=iQQluwMqR4vhkqIHLquT/vGESPR0mExn3FO6l37L+E59E58DpSnbWCWO+PEbaTF93Q
         3TSc2W8p7RxyNHeB/HN2Jho+b2466okztkCdK46lj7oUq1MErthXDYUI71FxF3ppDT/O
         W0EtN8Wb0z+WO4UzYvuLFuimqAM9vwqP7t5htQx2P/OdHgYaQPmN2PZ90RlH+TOeHPMa
         BQhecG9V8SxVgHfOOQfXEpStI2XIIe75GXJyBuNylNuWbSIlwfIpGypXRVGhMWKDSpQa
         hTL/8bbm0gIGKfs8Ku7XMXwyY4t/A+LQ3wAtxzI9ta5wdn6E19J6sKT2lZ8Qjb7Wlt/D
         4xlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354717; x=1774959517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxEuLOp4xC2eZw18lsPki8VzBGwyaM4MJgqBUAEFTC0=;
        b=MiA4QGGuRwxDCZhEhq9bk6oRngeJQCX7KopxO6EToIbzqORs9lNSum9OhbhPGrOiKv
         SKs46dD5wPfpxOs9m9sN8ES+dcB7KoGzoL7VsdJ6jndtOI4kqPEF7CtJ8/Dun03b/bBP
         Ct3gqP7uhTuwkr9q9PiLtgM8ei806KnrCR99LjCoYMaBn5P904MYlgDPgdMw09WLOVf3
         xUYEvbfpK38dW2GS9wBcKMUYO41f0VytuV22yNaTJI0dSedsYTQmPVK7Yloj4uKg5AqU
         SRGUHQyJFZjL3LSGq+j4xxwUn74wTVownatTkXq+sT7OEFm1uMWi2FgjC/1Ux4e61gsv
         p6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354717; x=1774959517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxEuLOp4xC2eZw18lsPki8VzBGwyaM4MJgqBUAEFTC0=;
        b=NQ0RFdG9rd55RaEIwEu/v/WPdfGRF1uAB0WS77+ENeJjc7qW3VSgBEZKofddt+buCG
         VpSHz2EsL7WSc/Ux0idgx5ss1e//1kG5F/SFySutpUQ4mN9lpfYsNYRm2goviYE5gGVU
         8bHxc2UDZsO/KUS5VbGsWb4XSuwHRdcb+IYgcEvwJpgFgkSIZXRfhBV9QWhjXvgK0Cco
         Gh9Zoawfnqfe+zYwpS60m9J8R0X1o0p1zqi8FzjKehCc3KrKFhKSlafxFNJDvqzmVHrY
         AngALej43jWHSPA4A7kb38LDufu/2Gs0+Nvcr9GVrn79gerUN4LAQYSZf91N4UevBxtm
         ezcA==
X-Gm-Message-State: AOJu0Yz3NECAgD8xLCtsERMYnj40ECzSNAARqBwZ0J+VroJUGz+HPnNZ
	impeKdKUkWEOQoTVNJw84DFmUtUHfhb7KDzlk9CfyjSXovOt0Z6K0vEcnJJTO962XRYbPoTLNY5
	hdeSTG0ZHWhS5e9ZUQDjuEKDyaAGR9GU=
X-Gm-Gg: ATEYQzx1F2nkIJMJiZs46t2E2EG5l3cM5+dB/dYb/zg4KSV9fWqoSJml11zWGC0tSWh
	1kJXCjqGrTNwI/a7LSsY9CoerkKbm7hQV8iGCgB21rS9uM5F1ZSrTqdZTa86ORz59ZST0o0Pwcj
	LoZ8NkrEePDa+91orkezM5pVeTttZrtBcYSAafdL5WHAgjCr+qIcmSOlC74BgIKhnwLtFW+O/3H
	fbJgMw7yVO+qu6kscWgf+jIbmC/bV0fgGPW1SGo491vqYxg2SWQi+/03U51cNLgSiKb7ROxrl+S
	N5qz5cBMUz2UlaLQLzRrJ30H9s8kbHpuvj8DdV9Ln6AqHoXVbL0LsryIq+Te06Nq77RBDA==
X-Received: by 2002:a05:6000:2dc4:b0:439:bb46:7457 with SMTP id
 ffacd0b85a97d-43b80592278mr5255822f8f.16.1774354716596; Tue, 24 Mar 2026
 05:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324121608.3444943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260324121608.3444943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Mar 2026 12:18:10 +0000
X-Gm-Features: AQROBzBFprl-LlBR1W4wMVA0lHzQhEG_DuaiN79xSlKGLKZrUA1HLFUH8G-m0yg
Message-ID: <CA+V-a8uP1dEiGH3mRGAUmzcB5u_ZgYMMPPJU__6OPv52ua+pGQ@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS detection logic
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Pavel Machek <pavel@nabladev.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30168-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,nabladev.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 728A9308244
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

On Tue, Mar 24, 2026 at 12:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Read the USB2_ADPCTRL register once in rcar_gen3_check_id() and reuse
> the value instead of performing multiple MMIO reads.
>
> Simplify the return logic by comparing the IDDIG and VBUSVALID bits
> directly. This preserves the existing behaviour while improving code
> clarity and avoiding redundant register accesses.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/acJV-Xq-2uq_JFMn@duo.ucw.cz/
My bad, wrong link, https://lore.kernel.org/all/acJVCOdlchLiSe5n@duo.ucw.cz=
/


Cheers,
Prabhakar

