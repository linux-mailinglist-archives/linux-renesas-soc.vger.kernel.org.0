Return-Path: <linux-renesas-soc+bounces-14348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B1A5F5BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 14:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E61316A385
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670B5267711;
	Thu, 13 Mar 2025 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRBYINJg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143F2676E3;
	Thu, 13 Mar 2025 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871876; cv=none; b=aXtxDSqy6qzC9/YbdiCB5fa7DJhl3ogvWU6lPVZWaIFk6jyYAJARCip/lzNHgb5DjR8QKqxvyGAzMXzdgZ3VpsErkzdcBcLO+pIWhdZotUVWwFvqCv8PiHgujx02tT0wowE3yllC11x05urQZc1ugg1zF9fQ6qi4WFQP7lhNfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871876; c=relaxed/simple;
	bh=pC0PcVhoXVR7D0DR4WGT2BxCw9RoFrMDTd8TbE77dk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9D4ypkSDdSBDwvDp692n8RRhvV9QpobeLGV4R7YLnR6yeRLHxhE9hUB/kv8p5u8j8Zu7j0Oe4vaE3V0nyjG/qsQdKVsrxVIaA9SP7qXm9zEzlWERSO3fg+2+s0+TXn7nAW7n3xWvXiK4AcdoX7yeZtgf1bLSJ6bPQxWhp3FHN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRBYINJg; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86715793b1fso442819241.0;
        Thu, 13 Mar 2025 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871873; x=1742476673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC0PcVhoXVR7D0DR4WGT2BxCw9RoFrMDTd8TbE77dk4=;
        b=VRBYINJgWXvR1TCrELJDE6ATUme9omkS0pE7rcp6zn6hXqGKb0f9tV6ZvK4wFImYBu
         QnOIq85/SkvFWTGHfJUlkSccNIi/Nit7wjEjZ3Lc/PHYs5DPSt5ldSWjPCugmF9PXvOn
         sf8uNNqYhXtLV2j0CvMpToQSEPOn4rWLNdQ0DhNIYCRQIl38JxTirJb1m+myu2WtFDl0
         yxJ4IfvrVqwAkTDtX4On1hnlr2Ip5N6QQ4UkVgtUB/hlRuXpV3XEJH9lGcYPfM1wx0SC
         sJgQMc1cqpYSW1f6ok/6xy5HTrbCfeWzqg5hpWRv3JVRBuT6+30qHUVhuLhIJtqTtAWU
         raCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871873; x=1742476673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pC0PcVhoXVR7D0DR4WGT2BxCw9RoFrMDTd8TbE77dk4=;
        b=caKNGejNBmPAdXfwEX4GqOH3GuqYt/h6sAE5afZvgI0z1g1R4UswL1MhfEvXFO5ozK
         JdMTqwjaPe9hYZWJhqkqOyhtbKv8qO4WPB/HRXvg8n+shdQeqT4hr35vSjdsVI078UM3
         pGTRe2N8NLYSStGU/JVeiFcH0Wl5ngjPZRZ6Az6FIyxs5xy44kS3VnXqTnnS4ZPPAmPU
         LaEkfhmcXzK8fDBynAo1pFQiTYeI/shCFy6FH9uHrADFIlU/XfcSmSRu8Ca7Oku23DKj
         W2LW41PXnQyg0gQ9hOZPCaucsh02UdxEyX0YjMZb+XOEfTWP/SbnqrSdRClZCTBoglcg
         jqpw==
X-Forwarded-Encrypted: i=1; AJvYcCUivZkubCT90IuFu2p9gALqEiqO/Yuc5UqelmqARS9TJx6xWPNWq+1nHvrmomOPZf0IlThUS8Wb95E2e2t5e7iMpsc=@vger.kernel.org, AJvYcCV1CiRpeXTKsbJo7zgr3LIH1CdSz9qrr1t0zAuXoHfwXAjuNaGJEbw8DJa5p9IclnlluGkJmHNyQzBijb0b@vger.kernel.org, AJvYcCV8dZ1pzZTG7wPXgMyZi2/Pz0p2cr53wQPFv0YtBrcUSEVMQzVo0t9E5+4MTvbegO0Xk0WiX34I5PGB@vger.kernel.org
X-Gm-Message-State: AOJu0YxRlhPTfBdwGPtls6IHw4lt19/P6SRBjSRysO5QNfPEm8FfVFE3
	25dQCq87NV4Ucv6CYNllpxo8io9txeHxsuQJopPB1hygW9oASF7AEHGxWKuMNfzOjS/VsZezDrk
	vJxIOK2rN07SHjby3eEc/xWI5jDA=
X-Gm-Gg: ASbGncvoPLmYH++H49qlLa4K7FLk9WVWAv4DE/gAQCL/S5hidTy/kpZHDFCey6OkRd9
	ITbtR9Oxlclfi030kBgxf0fi1LtS4JU5dejMk1YvpFOl083zw6AgF8H4qJx4gGFz7smQNGJ0Ke6
	gLrvgykBmWRMoklNWX1k1MlKpSlfV3RhvFOpWy3Xw2lUomELYzZvniXvCNyWk=
X-Google-Smtp-Source: AGHT+IGGQOLkqUqA/cVO0v+DjHSuM89sY5CvtqACB4v/Rd/XSNFARkEi/y/Fn9hwZxQh/GkdawD4UqbjaBQz53i5GiM=
X-Received: by 2002:a05:6122:54b:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-523e4173295mr20322538e0c.9.1741871873619; Thu, 13 Mar 2025
 06:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305-cesspool-headlock-4d28a2a1333e@spud> <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>
 <20250306-slather-audition-a6b28ba1483e@spud> <18780ad4be2c28999af314c97ae4104fb161a691.camel@pengutronix.de>
In-Reply-To: <18780ad4be2c28999af314c97ae4104fb161a691.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Mar 2025 13:17:27 +0000
X-Gm-Features: AQ5f1Jp8QT8lpKATDD6d5YojihdkZ8BzAZGZfjvYnMXXrc6nld8Mvop2s4MlR9A
Message-ID: <CA+V-a8tYv_u4UM5XVysVMPbfJoVwKFHqucLdJOmDP-xrXZ0L5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Thu, Mar 13, 2025 at 1:09=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Do, 2025-03-06 at 16:26 +0000, Conor Dooley wrote:
> [...]
> > That sounds awfully like "it was wrong before, and I want to keep using
> > the wrong node name"... If you're claiming to be some other class of
> > device, "ctrl" should really be "controller" like all the other sorts o=
f
> > controllers ;)
>
> There are "usb-phy-controller" nodes on the rcar-gen2 SoCs.
>
Ok, I will rename the node name to "usb-phy-controller".

Cheers
Prabhakar

