Return-Path: <linux-renesas-soc+bounces-23873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259DC1BA7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D35AB5862FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5A01F12E9;
	Wed, 29 Oct 2025 14:53:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618752EA172
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749602; cv=none; b=g0VDm5GXnTTE8wJu/riL426UaItZxt6Lbj/soku5tW9zgkad6kBRlz6JLR3TSUTAk2ayrFbZvcg6TO2LSM6VkSsIJqxoSrndoxZEv4wmgMS4cv7j+y81fK+th9jy55RCXlz3EnWFS8OOUuvvuSs9hllnQ4UOgHPFiLShINdmLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749602; c=relaxed/simple;
	bh=Bn3qdBMVV94+OQl3u4N/QcPiKWcf2tpN8VQjFewuPHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucPcb+WeRhO3frkYfotIudiQ2uU70TvgXHlP+8Qn1h+v8JFxUMOSB0AMDT2H8N60x060vxjE+gSgIp8giDqOGZ4RaJzGVaB0EBxjwRVDdhrjFpqzTe3n23W7CgwcxHbqIiMkdSZRCi3/pYLn6Y53ClPVLpkHptFpAqgUm3y/VQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932dfe14b2eso6098963241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749595; x=1762354395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq7cfrs8fVaBcc2FW3QUnIn+7UcMac5CdGnA5tYXOqc=;
        b=vw/iqnlLlsYLM5fZSxygrRIOVQgYF5kin0vMed3ATzlaeFt0V5m24Z9fcsca97J8nx
         synTJ78QeCQXZ6T51PAraGCBPcjjV7hTCFH/MMrVMlS7UOeQ5iZLy000DQhioovLYJ2+
         zx3xH6tj0bd/Ac++OUUHwELIqWIOdJSmZl824ESifAeIk9xMGugasgQycanagMdp7610
         pUnqq+OPiRNyz9qLElyHYD2NICOouOomSo/yF1adQtsQDizco8XIf3S0ogMifshzZ1aY
         Bjd+RBgAIWJ88H6sjObjxIne13SzdZI9BAjY49SDUNatcI2U1bQckiV8689TOqE3Zzgp
         sPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmCHMjvYN43ns8v69mgamiEqUncRex65KGo1oWWJN1VaF1sdt0Vc8UJtnI4iVU8mSDRZhgwweVV0IXBgjM5XIyRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6UtrX7WCiMjri+CxWcwZumr7eXgKgqc/heqJjmKlGWhlSqn9n
	/LStFj6/s/OcJpuQ5xp3mi07a7dnOMxZDnqSKp8mvx4ZAjQCdbBN+g96lqwSmfTQ
X-Gm-Gg: ASbGnctoPgPTCTX22TY0a2Ms5qxacceHQney+YmLKe6LX6UXXqLcVnG90yL2kxzQsz5
	HmTh3VY4PBmsaU4OCM8YJr2Jg6WZuBjWIjq/hHpZPUy2n3SYT7rr8xbFmxPQbwy2/829fHSvxe/
	R7vFpnFUqtBlh22bXhcHqksqjKEJlr+q1fCBGO8Yusmt4oyFbqeka69KOwn/bfLTdks+HMbKKMp
	a7XzWfO1MDnMZb1mi0F9ZZjJrYt4Dv1kRJKPdp2sojIRItFj2nFnni+kgz7Dlysy2t54bZiR6Ni
	xX+5CcKisO8C0pux5+bNJvnavah3EusKSnTlKCBZMW82Fx8Q7kMPDSZla8M+R+3xtKUYZQbULuE
	IxqIvsoQ1tj3d7JaU9xkKV81bClcuqAl3n7cIjzrGLz51XBOFrun5NzuBn6346QgL7xjRs3dnDB
	QiPXbzv6afMxXD98aXsexh+D+WgM3dNENEL86c0aWsg/CyTqFgRegB
X-Google-Smtp-Source: AGHT+IGxLZWmwdgivZzvoKrLqDKqhB96L7ElMkScFYhtR2aRViRJ10Xqa1up63xAlA8NEYKr8R3GSQ==
X-Received: by 2002:a05:6102:3911:b0:5ba:4f5c:874e with SMTP id ada2fe7eead31-5db906700e0mr1053673137.31.1761749594913;
        Wed, 29 Oct 2025 07:53:14 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c404f64dsm5222818241.11.2025.10.29.07.53.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:53:14 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5db308cddf0so7598286137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVW9WK5M1f/maP0onU19Jognhq4tdcW2AnL6TwOEF0CltP8kJ4zj3BoZvw5sRf3KWSUHwKBrp2pYDgZ2hVqZOfBGw==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5d6:221c:3dab with SMTP id
 ada2fe7eead31-5db9068d4abmr1045322137.39.1761749594055; Wed, 29 Oct 2025
 07:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:53:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+vkj4KEyxmvSSi=Zw5KSXqJK=-7ZEYm4q_odn0sYv3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkbcCJ5bca1fjv3psAbJaIosav5q9yqJotFzCTEHDUGlkGiEkRijKAzyWQ
Message-ID: <CAMuHMdU+vkj4KEyxmvSSi=Zw5KSXqJK=-7ZEYm4q_odn0sYv3Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3ULCB with R-Car M3-W+.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

