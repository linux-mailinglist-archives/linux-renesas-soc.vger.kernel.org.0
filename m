Return-Path: <linux-renesas-soc+bounces-22835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213EBC9B4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 17:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB7D1353752
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 15:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ABA2EC08A;
	Thu,  9 Oct 2025 15:09:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A92E7F11
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022592; cv=none; b=BR0rfbeKHZjmZW2TqwgjF1G+YGsFK81dp4Hkr1YUP+YikNd/Gy+0vrnt738zjLInCTv4MF+/lBbLh84qbDuMC2wnEUztw0Q2mhjBYTXR3nxBFiOltcOuRani68VUKqGvmmbkhbPnu+uVHc4jOA1yRb9JOgAYpwRokuN9GdyebLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022592; c=relaxed/simple;
	bh=G7BnJKOJ08l5+/PUjxt9C+wdBC0QSt1VmKpYirvoF1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rudXBvvRvy5r4TH+Ew2aHofgqNcaqzDE1OWlx23sNFo0gQ77NdK8Af3z2I3jA5wyQUER0Te1UdcoBl589FhScZkVWou1Ga37iXDxA9ocZ6qNH6PlpJiY8g8HCB3rrGitbYWJEi85WK9CI8PqU3MRX9xCqTofJ2JpZh5stl79v7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so977580e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022589; x=1760627389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFDqj9jQUKEWoN26aJ8wwmIbcIGNIv4JocheXpFei9A=;
        b=qXy0eu4deQ2ZbbrOjgQvrJ98FiO7xP6JTN2seVdZ6UgVRaWiFa/4mtaBl+3uoIHQbT
         j1cNj8Jbe/iJOdpcRVTYZZKYzhdanslJCKzrU5kHekEwDaqAqfAlhBJkZTa/CmeelLwH
         Pp6L0NoSCDSGbhxNMAZAsCVHk/k3gfm99zSxk6ztgUuElsZKvBSxjil8+uLaA333JAXd
         c3kg0Uf4aTbEU1KpCF5OZKZpTgHJlAbFi7Ca/zLLm/mVGFuO+S2xI4q+fT4xhqm+8/wI
         QZJacqX2UPpm30gO2JQJJV2ug/nfsyqSUmiwSB1Xq2t8Z4SmkMc8de1fI9e7i+4N5u95
         0qFg==
X-Gm-Message-State: AOJu0Yy537H3Vsd8yx3mH/QWsJ6BjbDLvn5HloAg54Yz2JuaM9Hl///h
	iMTRVfjkDWz1vBCwJXnEyJpK9loCYZY7RMvTHiFgEMCKhNAdye8UOr12IJuEJPHr
X-Gm-Gg: ASbGncvS8mVi2IMc8Uy2QEcJGS89WGdY4jcj8/p0JOh2ni9sf5wUQiuI76DuKcEcIiu
	e7ZQEj7d4/3D/1Rn9WN3OgNafysJvsU/vndJkYrHsWS6o5qXXarFiBw2ZHqqSScqKibB2EIykEA
	kzTx15oKAwhnwmfOyzl8xs8+T60bYj54RvPCMWsXmiq5vbNR7ODzGuKnal4hUJ5oYDYtEr2YTXd
	Frm0m+1zr6/oRpfSz9zId1AAFwZ0VhN+0p0khKuMsKCUJZfFkVyxntE/WxeiSco4nfR2OwvN4zj
	Z7ssMP7MWVs9UpUlGiifYAmdNxOoIIOqUn8HDie1SrGdJBE0rZrGPTVEOa9UNfNL7SJYx/VcS7P
	RvB55Ey09O4Uz7WwMbdXSxGiUTMFVy96ydtDqrHaYxjV68HeEh4WgL9NPU1Ta4YcY5dHyTDyyMX
	jg7f2nW+WEjlDzlbCNtq0=
X-Google-Smtp-Source: AGHT+IGmqmabjs1cEXJHzQyIGxUmjl6GvhBQ2X0RRUYdZ7MyHqU6P1PetdjV87HjOh+oD2FieJSisg==
X-Received: by 2002:a05:6122:3291:b0:54b:9f67:441c with SMTP id 71dfb90a1353d-554a8f28998mr5659373e0c.6.1760022588991;
        Thu, 09 Oct 2025 08:09:48 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf96587sm5349905e0c.25.2025.10.09.08.09.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:09:48 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so48802137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:09:48 -0700 (PDT)
X-Received: by 2002:a05:6102:8392:10b0:59c:1727:f59d with SMTP id
 ada2fe7eead31-5d5d4d8c8b2mr5359744137.11.1760022587997; Thu, 09 Oct 2025
 08:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007104624.19786-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007104624.19786-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 17:09:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBr=8upmYpf8QCenFV14L3ZkCtYd6hY3ouioxOdvvv4A@mail.gmail.com>
X-Gm-Features: AS18NWBDe24I_NNGtfkIk4NkEvfMFRU8kqsQ-PBIipjAiBw_hSlwxxkuVX-bPiA
Message-ID: <CAMuHMdXBr=8upmYpf8QCenFV14L3ZkCtYd6hY3ouioxOdvvv4A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: drop invalid
 #cells properties
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 12:46, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The 'ethernet-ports' node in the SoC DTSI handles them already. Fixes:
>
> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: 5b6d7c3c5861ad4a ("ARM: dts: r9a06g032-rzn1d400-db: Add switch
description")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

