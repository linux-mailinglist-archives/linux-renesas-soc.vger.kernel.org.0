Return-Path: <linux-renesas-soc+bounces-22451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F50BA94D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5D516EA8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F3A301486;
	Mon, 29 Sep 2025 13:17:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD262D47FF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151841; cv=none; b=SgVJLn3lxpD4wS/SHTZ1Jcm7gC1h9jfib3XCVic+Q9XiO9TMjiQU8dbu9fv68Je3uDr1lzz8ggQ2wFO6sW5Qq5y9OuoVuNYNm1O3uC9CRBHH9VrbwXieB6QwsJZY8NfP1bY/ELao05SRlLRJC91gBDIm/FNU81pWz5nvHDargwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151841; c=relaxed/simple;
	bh=wANisPC5z9cD4GP8SLP+vUm2YJjz+htvFrIhAJVRFN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAxU1KiiutrrpWPYFimax7grdHw7cT1aD7jfcGNq1OzAw1FFrJvCv/IzLn3ldSmOirFYtSWgc14Fhz2n9t6QH8D/kFL47eYzTobHMAoi44dIpDmqwYyD5NePFgRdGAJ+GnmDK9pnv/VA6ukaM6txSizWPkIPHKpQmFhR+/8zQhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1655300e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151838; x=1759756638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id1UL4XMXXh5ORipw4ImulCQ1+I9qnWpIF3nvWEwJ6U=;
        b=SPlAFlvr2FQm+BneEQ2eUVPNRGnN0A6V6gnzyrNBkSezo71uUMcHTiSaJ52vkp5iY6
         9lskT4QUPDr139RatEk8LXOhyaUfs3BRnwHISfgibsAo8hBugfnIAwRMlstDqhyBzW1G
         3OuNtgVkUEV5FJwh7oyMx1EXs+2xaRnokdITmSvqWxyKDMqx6sA2d0dKI1gVTyheBdZE
         3KZXyvnvIMfpnljk4qQOGE27EauER1qSYTeK9lORmsOpOtZeQo1iX5OpyaUaUXbNjzBY
         bGYlL7jKZYeYDV6bJ0u0Y2hIuYNvSTchTijBxN07b3lWnsa8Qw4o7HZAseWlO7mQ8LPc
         oFZg==
X-Gm-Message-State: AOJu0YzaidTOGLQPp2llDlMTY5BNa2Argcy59VPOn6oRIC5k5tTyuIlS
	gXSJ9x1JJjR39R60KZOKaQz9/9mSvTe1sjJjqRdCQe/IuGMcio1/fR25gtK8aypq
X-Gm-Gg: ASbGncsYAqSM0LS66XiJ60JfkqECM2uHhLpvHUyejyBv/sGxhogaEMYiA1OyyJXYiIz
	fNmnn/mhQp+IOOtrTTskoZiAjFXOVw8YT+3fknJMYmVLkmO8Msny3aEI65skT74Fl4SCwkZZcCU
	CfECidFcUXuNzcKk3YvsEJ34j7OA+1kUG/KiIUcCaz/zHR+Kiub8BT3rYVjAPlaOU56HnT1Q6VL
	zrtX2kkSfffvoWALJnNlIKca2pusP+tLaPi2SOmlUy+hQ+ZfP3FdARf+bG4d1jjpJJXvDnVRSFO
	468r2tY9U2vwjKHWpLlPrvQ01Sxewe543J1bs6nYysYZuWD3arupwxl0vvnUI8vOUs8ouMFufac
	SSRdxQHWkZ6H+QW4IrIzZjH/gh7xnuXXXO/WLPHNrGL7cRwu0zoBuJDkLVnh96uswZg3Ri0Pbtd
	4=
X-Google-Smtp-Source: AGHT+IGRUrrxVE55C/NHCfkvZy8dx29tK/h/e71eZceYH0/P+HBkhl4XcBsZPAravtrI1nauKpx+5A==
X-Received: by 2002:a05:6122:91f:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-54bea23b2a1mr6469228e0c.16.1759151838228;
        Mon, 29 Sep 2025 06:17:18 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54e293f2583sm607570e0c.7.2025.09.29.06.17.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:17:17 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54c0a10990fso939004e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:17:17 -0700 (PDT)
X-Received: by 2002:a05:6122:2020:b0:54b:bea6:a20c with SMTP id
 71dfb90a1353d-54bea1ad915mr5671972e0c.10.1759151836994; Mon, 29 Sep 2025
 06:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-19-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-19-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOG4be9HPgPoOj0xFhG4oGrrfs3=piXTsKD8dqeDh+Ug@mail.gmail.com>
X-Gm-Features: AS18NWA5bb57MOYR0sdE5zoJQUT8eGbxG9NrpGCCjpPsHgiXFut2wLNA1tKcaXk
Message-ID: <CAMuHMdUOG4be9HPgPoOj0xFhG4oGrrfs3=piXTsKD8dqeDh+Ug@mail.gmail.com>
Subject: Re: [PATCH 05/12] arm64: dts: renesas: r8a77970: add SWDT node
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

