Return-Path: <linux-renesas-soc+bounces-3649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D68773E8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 21:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE58A1F21B09
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 20:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E094E1BC;
	Sat,  9 Mar 2024 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vdlD+wbg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1841C6A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710017071; cv=none; b=aF8LtHDISdcEoXjwIZTPzVJOGlgEciSKvAqURnV6dydk1tWBdnh1vyk1H2K27ykDbyBfHaJzxQe5UVqxUWAgHs90WCDU0YGYShamb2sY5AHzvzqxOC3EWgLNn5IVPcQYCiggLsiN6JejbO4kS9DBWbsI+79TjlXfMgdrrV47hfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710017071; c=relaxed/simple;
	bh=6je8OJStr4Pa4XP7b3zCWLl8tAl7bGyeNCcit1YI6VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpRm1if5WsCqd+uAAfAkA5RfizvsVUX3Ar7uIe9NO/Utt/ELNXWWNNRq+FIsWuXMtPKjpQIhxg8ctMO7C3mpH8Dt69I4M3hEye5q8NmfleRpkh3a/BZm5epW/6W08FZMHXowdbJrcqa7+tXYk5yHF1ec4WBnVSfXTnaTwQrJohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vdlD+wbg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d094bc2244so45579421fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 12:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1710017066; x=1710621866; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5lXn9mjoihAOGhp7B+d0tg2VVCvh11rhrbmBOOVVV0=;
        b=vdlD+wbg0xbBuOhaBDqU2aN+bA0uyoYvisrWborIGP9pGqAUvRu7nKhu5/hCTQMvOP
         RA+9wbfuXXWMbGsL7PSLjGrNPEKM2e1gPejHpxVUk1FjTfstkY+xBW5UVaz2HPIWt2Q3
         85eBl0fseSQM+sRpkx5qJ9Kdu7rInStXxYFmfvgIepvHjTb5TDHApPAy9l4KqtpsEsFX
         D2F4tdOpofbspFQuNasKaepVPG6ZBw4skqxK4XKmP26BaLPsj0YDE0sOxkGZ1lXA2JEK
         6mLATPtfnb2yXhvRI5ymrpPTH386AE5np21KiSLt3OQJ5CUDf7yrblGEpPYA9it1sc+4
         iwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710017066; x=1710621866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5lXn9mjoihAOGhp7B+d0tg2VVCvh11rhrbmBOOVVV0=;
        b=Fpeuw5AU+NeHyoYTrHkYkgAhIwU+j8BNw497XyfRqY0HiwaQLoyb95qymSk8YUMwuV
         qzU/mBSjoYDQDNqKJcD/w0O6f/wgQofVEYfC2qEWavdJasF/5NUQcpqc8oB2qqxddGhH
         rtgql+fMoj1+RfMD583WVpEcLGw5U4ouEaZrZEW0NCg5aOIUxmeEqACaI8pnK9q6fLIs
         Guw1Y83My9wAaVPWnpH9bgZKgrNnAraddxBXiFycVKmKv2AfGSNsEhuFD/l+SRVSCrbD
         /ms6x/iCqnPU8o6Gw3SJwQbsISf4mICwy62mmdE7rGVi16FBocRPv5suej+7130pnc4A
         rwLA==
X-Forwarded-Encrypted: i=1; AJvYcCV/0UQiHpyCHBYynrK31Y9xTazMkYvn1kaX++cn5dqzNoC0kzUBgn5RaQFsoy90avopZ/JQ/bVjvsoLa8hqTtq7WmQLyrQ1IltHjjzMqguKkik=
X-Gm-Message-State: AOJu0Yxd6jd2MygQu+XaGZvat5zuIurI1//UMGhU8DhG7HmDB87Xkq84
	YMQji2GmTBNnKzcAzdYi78KoA78fdYBzF8ATHTQQf2WE+iXzOupf7Yly0Z/NXqo=
X-Google-Smtp-Source: AGHT+IE7NRyT3Ley26CaCThuo+hkdSr8zWugv9KKHw8axIGBGzlqd9vLx13tVr8cXJkBTaD+r1jm1Q==
X-Received: by 2002:ac2:4548:0:b0:513:5cd4:692c with SMTP id j8-20020ac24548000000b005135cd4692cmr1599691lfm.44.1710017065638;
        Sat, 09 Mar 2024 12:44:25 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id l4-20020ac24304000000b005135cdcf4a4sm422870lfh.32.2024.03.09.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 12:44:25 -0800 (PST)
Date: Sat, 9 Mar 2024 21:44:24 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/2] ravb: Add support for an optional MDIO mode
Message-ID: <20240309204424.GJ3735877@ragnatech.se>
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
 <20240309155334.1310262-3-niklas.soderlund+renesas@ragnatech.se>
 <f7bb4374-0afa-b79e-e64c-bd97b6680354@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7bb4374-0afa-b79e-e64c-bd97b6680354@omp.ru>

Hi Sergey,

Thanks for your review.

On 2024-03-09 22:28:47 +0300, Sergey Shtylyov wrote:
> On 3/9/24 6:53 PM, Niklas Söderlund wrote:
> 
> > The driver used the OF node of the device itself when registering the
> 
>    s/OF/DT/, perhaps?

I thought we referred to it as DT node when talking about .dts{i,o} 
files and OF node when it was used inside the kernel? The infrastructure 
around its called of_get_child_by_name() and of_node_put() for example.  
And I believe OF is an abbreviation for Open Firmware (?). IIRC this is 
because ACPI might also be in the mix somewhere and DT != ACPI :-)

I'm happy to change this if I understood it wrong, if not I like to keep 
it as is.

> 
> > MDIO bus. While this works it creates a problem, it forces any MDIO bus
> 
>    While this works, it creates a problem: it forces any MDIO bus...

Thanks will fix.

> 
> > properties to also be set on the devices OF node. This mixes the
> 
>   Again, DT node?
> 
> > properties of two distinctly different things and is confusing.
> > 
> > This change adds support for an optional mdio node to be defined as a
> > child to the device OF node. The child node can then be used to describe
> > MDIO bus properties that the MDIO core can act on when registering the
> > bus.
> > 
> > If no mdio child node is found the driver fallback to the old behavior
> > and register the MDIO bus using the device OF node. This change is
> > backward compatible with old bindings in use.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> [...]
> 
> MBR, Sergey

-- 
Kind Regards,
Niklas Söderlund

