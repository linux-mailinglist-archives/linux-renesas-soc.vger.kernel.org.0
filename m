Return-Path: <linux-renesas-soc+bounces-25504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B9C9CEE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 21:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B476C4E04B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 20:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A6B248F64;
	Tue,  2 Dec 2025 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeDbZySW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3851FDA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707740; cv=none; b=N/bIBfbGuL0nDbxLTeyyi9ieP1xCGENtn2vjkspsHZ2hpWrNPFORB6anjyMd+b70ddsJ3YbpvLrntl+j7AY5yUaRrOzk/91WohOJxGkM+JS6hzWNRBNY9yR+Hv3L7OlBTYD1HOyV81AqdPLTg4IaytfkFEA23926SYjp5HXtl8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707740; c=relaxed/simple;
	bh=fw3vvCO25y2QsEtxQr3J1GyiYMB72VrlHeF4NTnUQqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IH4LCzBXGGt08QHANAbPcgEEfzlfASOuvyDxF0N+mDZmX9PLx0/D3ezPRUlBte11Mh657ZZeSSJn34EJwFaUuOJbc5H2emabS8laCQvhW7qfpFHKHkSKEsm/1Wpq2nuL0zjtURQxWy9xMiRyHrtZGQVpk76FAkkA3HLqcmSxz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeDbZySW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47386C4AF0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764707740;
	bh=fw3vvCO25y2QsEtxQr3J1GyiYMB72VrlHeF4NTnUQqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PeDbZySW1zTNPKGFLuYFFkENgqxVpDwyrLAiUQCW/6EXoxUprZ6hRsO0wkCDp/VBI
	 EBcDuu5GgHVO2DeAfsMVIecsLTKWuqa/mqvQZ0uMsDvEwHeFqK77byPMEC+kEnsP2A
	 QpwIwAJwwW0PLghYBRcA2z/AUtknKtzSqWddjkXgPIt1uJfjj/DWytwkMG9T/hlf50
	 qzrFIp2+B70epkG6zI3HTM+Uk9n0Xrh4kqwdU5IR2T8MTf40xy8rd56jjjWfa19Prd
	 QEVbn7W5SlS07s4+5xPO+ORf544+9SA/E/SNTSrycTqZuozINKNUeBumPl6bLAcKSk
	 rNUrVihpUvneA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787eb2d8663so4177647b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 12:35:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWc/MGcN0tLX3GFEQeamRLJfyUMwZ8k9rCM5nppCWwyE0dxuzeTQS/KFRXrPfLwFvPryOm64S/H2rKARPwPzV3cZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKuocGJXNUOT1DTPBJFBl3kWCZJwuJ/AfXssir8ImrNE7hEAsJ
	kz8FCrM59nAwVYe+mh1eLsZmfMOH2lqlsPPTwYD0KyTDv9To4S8aXlEqu1z30KRcOrZ2m7fx2Kr
	CSdDUaEQk2DzWb2h3PEsOanPCE1IWGSk=
X-Google-Smtp-Source: AGHT+IHig/urPkaR1oA+wP6UgSBaE9q1ljtg9f8Gcd/QeEE1KBA/BNINyk+rLkEuRB3QcVgUPL0PGjj/DJwLFXDY/xU=
X-Received: by 2002:a05:690c:399:b0:78a:834e:b106 with SMTP id
 00721157ae682-78bff634c32mr31924477b3.25.1764707738655; Tue, 02 Dec 2025
 12:35:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
In-Reply-To: <20251202063403.GA18267@pendragon.ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 2 Dec 2025 21:35:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
X-Gm-Features: AWmQ_bniAk89rICI8zBhXLsMDXs2C_Zjmwnz8XeXqKahgHSWRTnp_0PHlTf_qEc
Message-ID: <CAD++jLn5NmPubNm_hv9xCSvbY9pAKj_GLFWC1Hq5YP6ZHP=UZg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 7:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> We now have a third platform broken by
> c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
> for a revert, to give us the time to implement a correct solution.
>
> [1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvC=
nfF3pBRA@mail.gmail.com

This is a mess.

But OK let's see if we can deal with the mess.

I will make an RFT patch for Rockchip as well and resend at the
tail of the patch series if we want to try to fix also that one.

Yours,
Linus Walleij

