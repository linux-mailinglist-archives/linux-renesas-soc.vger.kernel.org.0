Return-Path: <linux-renesas-soc+bounces-18920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E3AEDEEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 15:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA59188AA6C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 13:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8957286419;
	Mon, 30 Jun 2025 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXTnc73z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA920285C90;
	Mon, 30 Jun 2025 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289918; cv=none; b=sutU3loZIZEe/X2FLT4kVxmDmy+fGzDJrWJ7RBKcKg52YXT4LZ+9QTVY5//VkR0c+HZa6Invzm8YXHT6JaJllPacXtAnVoS+qegsESvC98LMoM2//CsoFwhgc+60JDTF50h9v5x4gL0yDDwawQntsV+EWnzaHBREuvVvCQiAHcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289918; c=relaxed/simple;
	bh=TffP+w81DxB5niBeiLByBFsIvqBvxoimOPYobrDCqgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KREOe3DE2RxgrExZaS87ZvxD+whci7fcrwxN8RkgEZEtWCtb4wMB/s6iIEAQYOmR2dKkwdDhl5NhoyLISq1qj2O9FIft1iksNO5s+11XgBp2/qPUufrR8FxI1v0fmmykAWKFEC8kjrxYzzjQTKyu5Lq6aUF6l2P/QAzo28Kn6Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXTnc73z; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45310223677so14653385e9.0;
        Mon, 30 Jun 2025 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751289914; x=1751894714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWKZbXXt1MGNSGBpHIFvcLow+BMCD6HbMM0tW8Kxqq4=;
        b=cXTnc73zEUp7SbfknkqjNg1cArKH0mFFZLJL5/teh+YjDhvNeFIc+CfdIWpQIv/ACS
         9jiaHwKxEXufblMcs8SeeOJX6XJ2niEfMNz6jxJzmTOjobB4Pw1xLvaqu2bLN6bSTXZu
         9lwRcOXPJSeJWgqWa2hFb2uWZiC1/urFrAF95dKeGZoaOlOVMqVoIsOFE6toFlz+7q/d
         zcD0Dzw21M7A1PuGBn4f7dRGaAtOqzVei1otTTobPUNNFjmw0PBfAjCzpz4+ksfZBw7e
         +GaPYNAw/5fcoIW3ZgVgOL2lnYlTVvF9qGbsvNH4fiwXmdG7nNo+1Eea5xgzGFKltkf8
         egUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289914; x=1751894714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWKZbXXt1MGNSGBpHIFvcLow+BMCD6HbMM0tW8Kxqq4=;
        b=a7wJu9XYy3v5kTVQuw0tyBRka5KvWG8iWs3PrwBDiqgwNITU1oxqPFgb/LSUMfVvcl
         Mna+QyU3UYCqWSubPImcDll3bOF6xXQaitzaaGRDyUZJCzXdD1NOeoxQQf1NmpMCBAHe
         V7V6U0eQPgskLFvCmO+Bsb4YZr9oGv/LJmH2WDtu7bv9gjIqwNXoLea9h82d4Xh/Jmmo
         brpdA/BhKkX1ib4T0Az9c6bW0HlTPzeT1OfUWUkTDextO6NX1n85y1Ctn8aI07Ft3eA8
         EFbzntazFJ2ZoHlBeKv9LfbdBVzsLthktQ3bmHhkYkIa9L7/Y+RGHpC9nE2PsmA65ifn
         EvXw==
X-Forwarded-Encrypted: i=1; AJvYcCVZakwrP2N6FLhVncOmdeA3RXmvx0CdccwbmayTIX5ICxMgbGBpAMG9d+EmSbHCTJl1Xj2uysPALP2c/UrKtHxMKKU=@vger.kernel.org, AJvYcCVbZCRNoSdFJoGa//A6VBb3pikOBlMfyJondfYVy6Gbhnt1pgLoYzyClwgBvxT19/rwQS78QoSos14jwiCcYi8=@vger.kernel.org, AJvYcCVoajACNJGkCmWnEoMZoB6uuyKxQ9l9woZyw/J0Pjce3t8GOUdrVzgppwFhJwP8Q24rV88x6QmP@vger.kernel.org, AJvYcCXtyko232lOrPG2V9IFIFw1y++6WzJQ48I2T7qkJmNT3xvgd2vQ3cmocA7veBBlVxeVCeLLOUXWJTHeICJF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJI56+BJC6QOhReVyu16VjjAdhaWMBYGdQGRChCIjhTJTXRfrg
	kSYuJtjfReEnhZOkwbFHkPJze9VsHD9UJrTid233w1/EMDrRF1OA3uiOFJc6hjaqpBx9hhj0mNa
	XZJz7LDfNpAgrA6MqpgU8nIVr+3HdXZ0=
X-Gm-Gg: ASbGncsoAEVZ6aiI+9/0ndY/zWUjOhKfTChujRd1feUGFubf1w4n0oGqOljGLoovepM
	QJq2N4I1oUHsUODM9xalOpvpsBpcVFE3PJ1KC5q2prXUXkQqhYAWwOyq63X22kesEReYCUxsAfe
	4VAkndphLGkj2FUPQLmaALjdEdBAVXSAsPNGS6BrX6AICK51+I2SjQM1DFThTxHCWKYcGQGav0O
	4ZM
X-Google-Smtp-Source: AGHT+IFJhsc5t2uBwX2uCe+JjDOKXfz0Y3S1DAIOkSjxWGgWlR02wfCerykLJS95RwiAdJtKehs5JUx/meb8rEBNuUw=
X-Received: by 2002:adf:9dce:0:b0:3a4:d6ed:8e00 with SMTP id
 ffacd0b85a97d-3a8fdeffa19mr10860740f8f.33.1751289913849; Mon, 30 Jun 2025
 06:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jun 2025 14:24:47 +0100
X-Gm-Features: Ac12FXzV_qzYoXPqGOfI-Yhjot17NKU3UoJJ-NkU3K-yZ0MLwXM8JBMg1AWrCMo
Message-ID: <CA+V-a8sD8CjQEatvo-3PRk6Z8Sw=Gig4J_HohmB7qXp6BaxTWA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:45=E2=80=AFPM Lukas Bulwahn <lbulwahn@redhat.com>=
 wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit d53320aeef18 ("dt-bindings: net: Rename
> renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
> renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
> adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
> DRIVER section in MAINTAINERS.
>
> Adjust the file entry after this file renaming.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d635369a4f6c..bff9651a9a94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21271,7 +21271,7 @@ M:      Lad Prabhakar <prabhakar.mahadev-lad.rj@b=
p.renesas.com>
>  L:     netdev@vger.kernel.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yam=
l
> +F:     Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
>  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
>
>  RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
> --
> 2.50.0
>
>

