Return-Path: <linux-renesas-soc+bounces-22139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B64B911CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 14:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D9E1898837
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62576307493;
	Mon, 22 Sep 2025 12:27:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ABA283FDA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758544032; cv=none; b=bdbmoLPQ2qY0yEpSieyKGzOeSrGYqEbmjCYnyt8JiPmx4eFQUlzHh6KpbcgQKkOlVPl97JkGV68zdMAd0Yq7XiNOR1QNdIYRkThea1emOzcBAJ6urVldTCEoRrhs/xujkFJt5/GznY6OZehxjd5j7iwdKRXIwcI5MHMozmgsxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758544032; c=relaxed/simple;
	bh=Snc+y+UZSl01zV8eDBdsBhyJcxmhXXBXe4TCo0P9J+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9qzJOaTReJfHXIwA39/Sa6zQnvrFn+vXHhpmhf1Fsaa/Bd34j+qznqvkO81MPHaN8drWbwrwfrtETaltq7z8gBSPVAvywUTLCmgjx7cYPst1sOKXdfJcR+Y6mtOhEwD3zLrOLsj2iIyXskHiZbi3pn0p3WD3ReriLCZGFUgnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso1544585241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 05:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758544029; x=1759148829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFl1v/smUWw8zKINq5vSCtKklPR2W7pYT54Z0Y6WQaM=;
        b=FKiHk+dCWAoyaNe4MfyAFxuw4YKIRUgSac253PIgWvp9/DWeHo86UoO3JVoFmQiVm7
         U19UinwxU5tEujbnQDa1gJOMXE3/bkVGWvSRmJQSFG9S0KJzFBTMJTAqRpeEINKOAvap
         0yc0gW1qvLGB7qGaZ2wgXMOZcIjzNYzr5uwGel7EGi2mGEGTmuHRui5SH+8oLALXQE3C
         a4RrZ6s/yghh/2xFSPs1ip2UyvI/QfIaIopKd9tud+xT9g6z4rHF6Ty5/2y5121s7LrB
         u7dD4xvsUAqQ0wL9jMrGzLyzEND+hygSorl2iRJ41+VAiXSDzs7YBzpS6X7Dao1qfnvP
         epUA==
X-Gm-Message-State: AOJu0YxSJoigUfklqcaI+MJ8GfF/e5ngW48GxoQATTMXuw7IlcWvbISE
	IcErJpieskLjXTO/4gfrAxnVaJGMqiIpxDXknOppdifQI9Xl35okCwolnxTP9tee
X-Gm-Gg: ASbGnctfU0rD4m7kTqaRm2u1PJ3MO+JYCuvN3Ze9NC2EE9p9Vr17pYB1J3aI06FDC5n
	KKUQA+lyEf5bco5aGuLdzxSbh/CMI6t7ofMU6NzzXOs+we5tHAlvmP2WyNsWAESm60e5vNy5V6c
	f5Hy8iIwV5cv2xcYffEiLidDfwn7KUwO4f5h09f6dzKRSGQTYXX8YKt+NlJmwT/Nq2fRcUfgyFC
	sZK+hHh1kR3ffcARmvCl39mWnhOuucu7x3fnAVbbONBKzA6F1LaY48NF2jvSmq+t0zS3b1dk4Cs
	0coJMu0uKCQFiYlUgtf4vZgwSIA1lNuJK8frEU/xAAX04C17sJRhaW42WEv6hd7j1H4JsPE7gQA
	CLsEFq60V1/NizOYRSDEO304GVk+ROtWjX2VTJgws0ZVQjeudrZpZmsOzEnzh
X-Google-Smtp-Source: AGHT+IHCxCw+lMBcV/wPVnAXnPyLXd/IrdVpBn9JafoRO1dh7qXycjCHFsgR8o1GZPgpVRrZNJrqNA==
X-Received: by 2002:a05:6102:3587:b0:591:7a8a:1d99 with SMTP id ada2fe7eead31-5a304362d7fmr566592137.22.1758544028994;
        Mon, 22 Sep 2025 05:27:08 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5a3d7d08f7esm204633137.17.2025.09.22.05.27.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 05:27:08 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-51d14932f27so1324088137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 05:27:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8d:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-588f5e88e22mr3412259137.30.1758544028231; Mon, 22 Sep 2025
 05:27:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920070433.8229-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250920070433.8229-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 14:26:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ1W1njMqx4JwRPqYmzGbaL9b-yDMMypR0Nz=45cUHGg@mail.gmail.com>
X-Gm-Features: AS18NWA_sI1k53sqL92gwsAZWbKQZy_7JBW7AneadV2NTK5uOqji7p-pCXlboDs
Message-ID: <CAMuHMdVJ1W1njMqx4JwRPqYmzGbaL9b-yDMMypR0Nz=45cUHGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: v3{m|h}sk: remove wrong sound
 property in HDMI encoder node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Sept 2025 at 09:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> '#sound-dai-cells' is not mentioned in the encoder bindings doc, so
> dtbs_check rightfully complains. Remove the property.
>
> .../renesas-v8/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: hdmi@39 (adi,adv7511w): '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>
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

