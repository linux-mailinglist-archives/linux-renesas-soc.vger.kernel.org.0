Return-Path: <linux-renesas-soc+bounces-30660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOZjBPLzy2lwMwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 18:18:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A336C7AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 18:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF42F301990F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 16:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE6C3E3174;
	Tue, 31 Mar 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qkR/+e6r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAA391833
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973801; cv=pass; b=sERVG0WLzlrIBX6jTDncPZE10pu+CJg8GZjsEWJNjh+vZZOLfpFT7jLNmTlppIPh3ZFDjuEx02EIc62EU5rCMaBVIPjqMe0d6aG6eYkmxhII1fjpOAibi4UUvqsoFgzfLaum4vY/3w2IIbM2x+ytIhJNd+FnP0V+/w2/epsoSCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973801; c=relaxed/simple;
	bh=PdXUuqEb8P2nLtRABdAf1D54EhHyDpHz88/TU3e1YPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmoQea3xaIuHCHTGHgGvVSsYOus++CsVOCazXZOkTlWsPI2+ORW28CKGqe8Mz1o7iXFdUDQWC2VMaFPSrrzONddkPTH8Lg7pTykbQ/nP1gBIKk547LeHpnOFtxVx1/pJOLJRVigFWW8a7Tq9N68bbRCGpD/4wWDdanyG7/+H8Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qkR/+e6r; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2bb0fe3bbso1102467e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 09:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774973798; cv=none;
        d=google.com; s=arc-20240605;
        b=NYQVaonP9OqDYkitNgZctll67+vz4CU9fasbJcenk3jvoPojNxLz0TVgNwXn4QdNnm
         uRo5gj0G4OlUVQmw9ZSCUVcNwMlhkIV+MiwMk4aRNAkHx+Nfq0YrjmMrgcLAzvgWkEgs
         vbbzvXR2R5FwYFpgKKAIEVFUPTVGLveq3sVgRg68TqBG4BjPkKLK1bHAj43pYZWweW5f
         bMmbJRKMRbZDaYIzizIoQUUNMZclTiConfnzhdK/W+OCHuOcu0yAZNZC25LE9X/crOux
         YOnAybKYb3vLWs0mbIv2D3AzVqfOU8wj9bna1kX8seQRBIZxr7+V5/31VkDx6vvMqPl0
         0Dtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fYuenrYxRs1hIaVFfS5LtO+C2IDv/Kg8rgYUxajz2pc=;
        fh=OfCnPVhuPDim5w3RmlSFsAVnL/TD2YgnD/myFGfTgO4=;
        b=hNXHniz6P+2Z5EKqAMcvjcAdXBUtm0HTAo4IxrNkP0aq0IFVo+F1G4l58spR95/8sk
         Pg4JU6OM+QH7P2XcyKWgBDWCFLxj7ZlfKTZtrSEZcJs7hsa6nu3iLFg8dLfHjnezWm9F
         klWXhH53sbEViP3Nn3tjPdgERrQOyNg9cIYyy3aSJHQHHDOSSg01EIB9wBvVg/QnZcxy
         /so3DOIxkGLxEK2UDLHfs9D70dEngvg/Kz7e1nPbllWRcgMKaO8Spvfssw1RLrkPlx5g
         7NJCu5R8swcga31OHfEE3ZkEHXDgVA8A3M8Pe85AL1iZO4Z65kfk7NHyRI0yOtSnpP24
         knDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774973798; x=1775578598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fYuenrYxRs1hIaVFfS5LtO+C2IDv/Kg8rgYUxajz2pc=;
        b=qkR/+e6rSC6L2YeCDzOPO+16b+5+XYdYBzx2UAHu6ZGClEoe/Pl9npFO3+N/VONfOv
         QeqfgZDj8+wWQwvPhUNqDQy0P23XzLhGiqNyxL/Ek26f2DiCEi0JLWI3xnoXBC0ok+of
         dMXW9TVBKNWinsFa57dcOpOKfPUIfAsZn/FXUO6v/x1CJf3Dagw9wYrBOsE1AXtTsPM/
         qntHP0n1hAVv43WSbuw5MpIIORyEqOzG+MKHzDI5d25S4Sn7sKSLTKWjWjk36SFJiJM7
         doHMQuTZ6nyxjWKAP5CGzT1uZ6f3fBmH9J9bsesz7p0IGE0DvRJTApJ6LhhVVdXR1T6h
         gmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973798; x=1775578598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYuenrYxRs1hIaVFfS5LtO+C2IDv/Kg8rgYUxajz2pc=;
        b=REc+1u0zCbIvpYPx8S+rf8AmaYZTAqyzdQvJy+b+r1fKP80mhYau4xU9Tn6kigH4vj
         JkQ3HJJTrcEBAZ63sS9uPry7hO9Jl8rLUYExjT5njsY77QNUOV65kzjg29sktaq+WnZe
         X4/lzP8pknKul6UCKqrC4q/BSK2zvmj71MFK1QXa4/xn3cl1gK3ofwXG+6BxoCLeXASe
         WktilJO3bUqDbGYPwCwTWfeqE/43fubrO0VIE8nGYeqZbF43YexP0e/nqbkeUFykwXDo
         iQyVLspikeJV91gLjgzK0/bh54tQlixDMcC9tvj6Nz59B0OiFcnc7WJmP4A5A3dOJzGJ
         MqFA==
X-Forwarded-Encrypted: i=1; AJvYcCXN0JK+5pIAq2SuIfcneMWeys8YT90ZDQCgxFfwa9mxbtnlQQC0rFmI3qYq7aCpaKBQFIVxjSJyh/LGaXFY9wHhcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4kXCTqhXFi7VLVdgTYKArbybaTecXdV+BLCTxcuuxKicIeYo
	4buDYit3d4/kwEAI2Ym8xA4dTT1ANyKkkTk6VmZlJi5CoUzLjLrNNRGxqSx0TOGqFa6lt6JhYAD
	iI3+z7rWrXLrMujVAZVjLJvNs7/UxKSuynDlQzNgumw==
X-Gm-Gg: ATEYQzxuWVNC1z3XQdeWPCsQ4E9qDuoPJDmo1nOeaVGRIYAL/Kw1GCRVl0eJjeuBeRL
	WOOnWDBjJzdVvtolqi29MNRf+Tps2r/+IRniHd30vQYjhiswUYk20TKQGFdNzx0o4+sVuH0cies
	KCfH4VSraDSL9CJ0kVPevZEMq1u7YDVuxQlK+W65VS3rBxP+/7Vvkx89V2j51Wm31xaJPuY/IW8
	Vlpu2IyKr8btIi1Ck4rjWbNXLvaHOMAHrx15l++h6OLA1powgfbG15Db8iIfYrLGqv+hRs+nxNo
	Y7WMe9C2
X-Received: by 2002:a05:6512:3c9d:b0:5a2:7e5b:5a48 with SMTP id
 2adb3069b0e04-5a2c1f1971emr25224e87.26.1774973798287; Tue, 31 Mar 2026
 09:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 18:16:02 +0200
X-Gm-Features: AQROBzBFDKvBTS1qjOaIkCHToGwWTNjtaDfuibyZ6KRUHSwe3KLJFjsj7kHYFws
Message-ID: <CAPDyKFrTto5j5UeNOmmUa0dW5_StgRAgN3o3YvL_wTAqE5LQZQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Add USB2.0 VBUS mux driver and extend
 rzv2h-usb2phy reset for RZ/G3E support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josua Mayer <josua@solid-run.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30660-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linuxfoundation.org,solid-run.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AD5A336C7AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 at 19:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Dear All,
>
> The series adds:
>  - A new mux driver for RZ/V2H USB VBENCTL VBUS_SEL
>  - Updates to the rzv2h-usb2phy reset driver/bindings to support RZ/G3E.
>
> Merge strategy, if any:
>
> - patches 1/6 can go through the MUX tree

I have quite some MUX changes queued via my mmc tree for v7.1-rc1.

I can pick patch1/6 as well, if this makes sense for everybody. Peter?

> - patches 2-6/6 can go through the Reset tree
>
> Thanks & Regards,
> Tommaso
>

[...]

Kind regards
Uffe

