Return-Path: <linux-renesas-soc+bounces-22452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B487BA94D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F001895229
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C913016EE;
	Mon, 29 Sep 2025 13:17:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F525EF9C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151864; cv=none; b=fdiPFWnnJ/xArntdPVRaKouevVlRTjT++uxMxUipBMk3K3eB123PMQL/Qh9cJxfAkwiZ6oLguIM9obQUsK+u/GDKZ/yFVXRwDhOlL1mO4LQQGoUO7Ba4jXkFaCLBZOvOMoApPtXTL3p1yQPfdhNMSQQ+rx40WQ9+CqXKcJV9s/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151864; c=relaxed/simple;
	bh=wANisPC5z9cD4GP8SLP+vUm2YJjz+htvFrIhAJVRFN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jorjtqlq02iOXgwv5KovU2CI6S8C55bbui5uj+EO8c7GXyuu/0KiANsZmGwzZ0mj0oEJ/TD8hqPHF7R8F65BTFix0IBTtpyWMVSrMO4Os4Qlf9CfgSW45kh8Pgunqtf0i651QdyskBuT+XGaIuul2Jzrg/A98WHdV2Kvjnz0hno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so1359436241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151861; x=1759756661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id1UL4XMXXh5ORipw4ImulCQ1+I9qnWpIF3nvWEwJ6U=;
        b=ixKZQpXbeeQ/TUqfUgpDgprctIxbULsS4pd08JROiA+kWEF6qtrM4julkwF23N66w8
         VMCQi4baDIrDldTw7stj3PbO0sDE9dKvhyV0oY1rPre85EqA854IMSgGy7lo3txYhhE8
         Mpn1+2tcbAblATFTPa8ADR/qzQ/5/Mmmc/NpPllqG56CvxIaASaMZ6e4vomHt0uAtnlU
         5+08KPYM6/OftYF6Rz0py1cASN8MFshCOtU+99FPOAF8uCpNNfUrU/Ax9jUv6QxroXMc
         6kQ6b4H3mpFhi8bHRW+nsAD23JMUcsip6+sI8u9C/9Q5IyGXqDxLaGIWrTtU3Drbn1Ac
         oX/A==
X-Gm-Message-State: AOJu0YysoZp0BaSINbAczl1Zn3+zBNBTAcmUYUQOF2TidTv4Bwk9XHj0
	Kh2l6WjeTG5Pu5q6gAUPwM1SyoNsW4aRGLX0t4+4FmwSXIJY9ZHeaj8HFQtgn+Qt
X-Gm-Gg: ASbGnctA1mxn3Rd8NxOeotXmQFAxnjqaqC4sYMDPNywwvk7H7MviZ5PoQoPYE883X0k
	T+qILM7v4a8p1SR3JCfMpAs84enK8Q6+sSS1fRszZy0iidzDCbVqbZKDsfHLys2CY0/zabFzudr
	sX9PVQl/njefX2K5FscbOwueQAqjV3JR1YngXfXMLi/EhIwdkTO5t6czzOH/biNatutfOm8sby4
	zlL/1/Bb1oVmCLpBbgl6yetnOqXLNVoW86kt+7BRm/gxuda+5g1P2zkYliJaV8TzayFsM7Mer0T
	6bLWLePJpVVmcf1LpJbSGncRSoIPqR+n5DUqv6ESdJcLaUS+CHhvePaph7cG/DEbMfJX9ncCkQV
	9y3ihJJv0Ln2X1PXJQhSLQSpoCaJoYUtMcQkjXpM8OXNpr7nxYzz3bwwcFUqOvjQvZbNFQ9w=
X-Google-Smtp-Source: AGHT+IEJHgpJBDRXzsmECV5E9vvDbWTSpv6Sw5BFFVWVs0wsOveBRwiAUpHWNTNn/BeM5+DDS+wViw==
X-Received: by 2002:a05:6102:c4a:b0:59c:110b:d09 with SMTP id ada2fe7eead31-5accf9c625cmr5826822137.21.1759151861408;
        Mon, 29 Sep 2025 06:17:41 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae305d0c44sm3363639137.1.2025.09.29.06.17.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:17:41 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so1594888241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:17:41 -0700 (PDT)
X-Received: by 2002:a05:6102:161e:b0:4fb:142:f4c0 with SMTP id
 ada2fe7eead31-5acb9e315fcmr5962804137.0.1759151860562; Mon, 29 Sep 2025
 06:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-20-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-20-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:17:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMq07SFfeDgL-7sPY54-n1b+qFMjS7kgFFg9zZFN=WUQ@mail.gmail.com>
X-Gm-Features: AS18NWAbAqineoRmYj5Jq8UCU8f8DAP7HvbIppqEePti2o8XnnRqHvranoNGjag
Message-ID: <CAMuHMdWMq07SFfeDgL-7sPY54-n1b+qFMjS7kgFFg9zZFN=WUQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] arm64: dts: renesas: r8a77990: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

