Return-Path: <linux-renesas-soc+bounces-22450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD6BA94C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E6741C4ABD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9222D47FF;
	Mon, 29 Sep 2025 13:15:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F44253957
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151757; cv=none; b=G1mAT8lvXiQY13Q9XTEn7BmWoE8qXjyEnndx3D4fIbuOKp7l5/q6WZrgndG5V1P5v1memchv8VhUI0znDR+eyvcbKzEup9DnnjhUUVNTqSPsMySYRormacFNnME9D56ZGRbBCBVdQbHHgR7fPjhSWgh6fh0Btac5W0Dn377lXRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151757; c=relaxed/simple;
	bh=/CeoiIO4oEpN9VjHP8HfKiYF99Pkq0Nca8WusPYehew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cg5wdgzhX5qbLLyEbCHzpShU9ZvxstbhA4UDaDrheVAg7hiFwTWpBu7CtRhNlBRpTNc0HRTWsKl2hYNiVV/yh49br0OEoki/SJTV1UVVRd3YRiyGV0Gr55v12Gu2US838b+g5RFjmgcJw/SGZoUg0+cR07tgwb9g8pkOYQRE10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54a86cc950dso727715e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151755; x=1759756555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGWKfU0acW/iaFNqPdL/2iourou2d7uCdc802/WdX5U=;
        b=sL2KlbuVM9OWYlGAufesWFydp6g0as+htj9O+NpVYTlSeHkFyHkN2K0FGOwI6q5PYW
         zj8UkBw9qvm3HgvFLMg8Zc2YlfiC1tLXc2xU6qEnSNpWwmY8WLEUpdiv3X7/keWxA64z
         /ck7GDm2hRabwde7UFVDD7r5Dz3Z9bWblyt6qGrwS3N6VVMGbY5Lzd91eFEENdEmzNr4
         qgFB/j5l6OqIx1oVLvFu8HgZsnZOXX8VDWH1qhG8+KRTGZrGfKG2IFM0Oi45foWG9C0E
         aYot4D/+nmkhe8qf1p9GvgxRJRGg1QfY5h4ITVTGCOFz/X0/gV4JesCyzS/0hJ5vx6XF
         FwRA==
X-Gm-Message-State: AOJu0YyFJ9X8BbttbZa5guJyWlguU1jUpMVCrSMW/KUdOCoR5cIYOCmU
	byRcOOrahy9FY02mfCyIpPWwzZmmUwLCJecYbAyUNdKXTxUZAiy+O4PS5rf7jeCD
X-Gm-Gg: ASbGncuLr4KmF/16oNffk9Ba6F32VEe5oy4QCs17s/QeNxTB2iiPvad0PRveoITBtK2
	kbfDQdiKaDI2uFA7rPvWJofD47GDo3t8mQ6hEEkIWKGkjoxVPAWEgdBj88VDxTKnt47HozqTCCK
	KDJed3w3STgyBd8Qg43pof/CNy2UJtzi0Xz0DUKDVCyfwT0ykcbQKjxNFHl/7wLwyDtQUvfpcZR
	Kilf/TpFevTDp5X5Fncza7Y3RlL3C8Qd3t+tjF47hkqbtbXhxTHt+CXtYawSoxXs0FR/79Zg41t
	RG9llJzGJGX4HQvXAfEeXXYt7jNS5uh5q3EtRudoPoUeBNrm2doppjAi82g01cvEbNy7c8xPMHB
	/z1hyrfojXdqzfUSw78DnPoLMvF2lyncC2aTs8iWqyOG0+ccYZvXNSgQHusaBguv7
X-Google-Smtp-Source: AGHT+IFacymEOObt8bh9Nkc12LrgjNb9nHj9hTankUNEsFco8x+XdalWS+wGopO402F7ItPFHjjhIg==
X-Received: by 2002:a05:6122:ca2:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-54bea25c24amr6629478e0c.16.1759151755251;
        Mon, 29 Sep 2025 06:15:55 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916c5a9304bsm2527025241.0.2025.09.29.06.15.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:15:54 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54b27d51ef7so766821e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:15:54 -0700 (PDT)
X-Received: by 2002:a05:6122:1826:b0:54c:45bf:f46a with SMTP id
 71dfb90a1353d-54c45bff790mr2160569e0c.5.1759151754565; Mon, 29 Sep 2025
 06:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-18-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-18-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1AESKsNuY6yS6aHvwCme-Mz9fw_BReGRLOp6nBcdotQ@mail.gmail.com>
X-Gm-Features: AS18NWCQHGbDn1LN3Qqq5MLqssx2CQw08lzXj0NFF_OVRAM_PLW_6O8B3mwMYPs
Message-ID: <CAMuHMdV1AESKsNuY6yS6aHvwCme-Mz9fw_BReGRLOp6nBcdotQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] arm64: dts: renesas: r8a77965: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on the RFC is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

