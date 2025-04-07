Return-Path: <linux-renesas-soc+bounces-15493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503BA7E5E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028293BB6E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6360F20967A;
	Mon,  7 Apr 2025 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPVF7zbe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829C1209668
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041921; cv=none; b=dah02kGbAjSb12/Oqa8ep5r6cdg6z+SD3loYjwmYmnRoMlni6bfiJ/+blb4m3jw3gT3QkQRCaBYr5yR3JB2DFFJlmCDIHrnYMI2YV47ClyKs+8eY+4+DhgMXzE9mTdyRKQEO1FClsUuP7mWv8Y+Z8J+h+8csEkWv1fDpOGbfV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041921; c=relaxed/simple;
	bh=u0aF0vd4QcjvPIuR0+km623x+V7ksr6MnKsaPN/8+xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyhxQZi/MLw7WJO8PsZLK3ILjXBbxKATY+Ott/lUyhvp3gtD2AXTCRwBfH5QIqZhqvxbBj8WP2YO21dVO4bnvzX2odTjirg8zvjHlzHw7XmZbRZt3CH9oZEFm++tATGivKFFxErNjrI6/3wSdeAnnxwePc5grZwrOB45uzm/H8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPVF7zbe; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7020d8b110aso43072557b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041918; x=1744646718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sIltRROPIS1IFEA+sscZBf150A68RCMQ2MklOTTVcXo=;
        b=DPVF7zbeZiok+kLrcO1mMH5DVBDyne3+gv1n9v70X32P+npah5RaGGrQQ4Xmv7MrCS
         r0vXD5SL6nF78IAwk9X8voAEtQh/oYeXNItxXIpCQlnpn0L81ZrIP2MBeloBUfzWcbvz
         jFIVwhc5u8zefr4AyHn5atFJiSVu+E+8/0oru43HXp/tY9m7lxqFlohmncelf4Bb1jfe
         iTtHeUHbyMxqAbClhlyatFHyO3E7IFW+AJpZlVlxaf2pPtf9fOqeYyzfSMGhXKjNq9iv
         W24wDbL0kK4UKLYZHj5l7MOcPwNxb0vGdiCFqopfl8Q+gAXT6o6TtOFF/TmJ/DVBhD2w
         VUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041918; x=1744646718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIltRROPIS1IFEA+sscZBf150A68RCMQ2MklOTTVcXo=;
        b=gGwlBN34CtBsCINLfzM/xypF2s4cmf+8cbhE/3tY/mjgjHXQaR2GARJnPLVPAdw5Ee
         gl8WMBZxd4gocogGjYtrR7bAMyhkrrTdgQHLWGNuWr0zZq3gb9KqfQIptB/4fCPomZZd
         WTrJLsRuCnu/0i8+ihBmduci88YsXzyiRfYtP4ZRzs4PESPikLWhQLFSNh7c9pMEoxNB
         kvVaFAO5N3jmU7lBFrBc8kAWm6tpXRkvyyzj7gdxy4lHMN/LDrEJY4z5g0Q+vacRywH+
         a56NYlxh3svURBxPuNbXkM1cogCjvrelU2z1LhgQjGEhtdzMzobR9bKtEpnJvqaSi6Cz
         bMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQZMxoPgTH54jb4vVIYem0mlpeIHFF/tDKv/de534WWcKSuAixHKi4vxH3GCLwHHS6ZAlYdNQegU1CH1MIa42jNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtN33P+py6W87y1sg9/r7JFKqU3ENcLjxDPW5UYiZB/69isYn2
	PzKGYfD72av1IO29VvAKZP6DOsuc39qMDJJa7Cqn9VfzeTPyf+pRAVeLzUqxzdbDY2bRw/hbS3B
	L8rxyJpS6PbD1Kb92MCqY3HglSRRlAGTWwz9aMw==
X-Gm-Gg: ASbGnctU2EKsrtMtgUX6xRM8JFLIr0xphgOloehZ+pduCebO8Dl+LCNGCIDsbEPoK9c
	XJxfoQ3PeBXVaxaNdRDCFeIDt5ibTb4tMzgRNCDBnla2omT7dWrvjFW09eXmXb08ZfRV8hxnrVK
	er+dBdPBqNhN0oJV18fg+Prh/DHmM=
X-Google-Smtp-Source: AGHT+IHfemisUrYTSu+R+ITsGXJEjJhr5usaC/eR6dHy88Fr/iGTY4qDERK1sHs9feVLfrvg0UHQslChxfDxU3tm638=
X-Received: by 2002:a05:690c:630a:b0:702:46a3:4721 with SMTP id
 00721157ae682-703e153033amr248995447b3.15.1744041918403; Mon, 07 Apr 2025
 09:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:42 +0200
X-Gm-Features: ATxdqUFP_RvU6m6--vLVjW3iZgEwByAoHi4eONoRyG_VyZwI9qdEZYqg6kr0NJo
Message-ID: <CAPDyKFrCy-rWeYz3qoRsTQkw+PY3e7=zGUN==4U5_8FvdHezGQ@mail.gmail.com>
Subject: Re: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

- trimmed cc-list

On Wed, 26 Mar 2025 at 15:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
> `renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
> RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
> existing driver without modifications.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 773baa6c2656..7563623876fc 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -69,7 +69,9 @@ properties:
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rzg2l-sdhi
>        - items:
> -          - const: renesas,sdhi-r9a09g047 # RZ/G3E
> +          - enum:
> +              - renesas,sdhi-r9a09g047 # RZ/G3E
> +              - renesas,sdhi-r9a09g056 # RZ/V2N
>            - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
>
>    reg:
> --
> 2.49.0
>

