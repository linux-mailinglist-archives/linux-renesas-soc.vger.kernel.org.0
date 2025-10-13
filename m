Return-Path: <linux-renesas-soc+bounces-22908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29156BD2422
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 11:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DDC3C1AFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 09:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402572EAB8E;
	Mon, 13 Oct 2025 09:21:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A552FD1C5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347311; cv=none; b=YLUGtT7zK8yRrLinRJoGUK1Co7kkoA3pcFZF+wFsK5SbhypOrTBUueod6Quw7MzjEmpTIPmfQxo5hd9J++L5uRRvbUQfXKtx7z5H8GADtmqfaUCfM6Rl7yT9Q+XBHyaxZM7y62oLddhfR70T+lgZyEdYRkcfvP6nv7OAS99sjuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347311; c=relaxed/simple;
	bh=RjZxcAfi3V9A5U9SAZfg5Y9LkVVCiWAYMVhIYAGJi8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7pjrsJCRmliUomopG4iP0+B60ulyK2nFdcjbaUXmjaqyDW/jW5dtE+IPMPL+Y4qSFcWtoJsp5ehbLlBVBv3rwVxFl0UJNNiXT9fLRetpBjj91WMdFt/VAOdefvWwGePnP29K6XxMso2muI0FItfIdC1yGa2I7+sDwX/VUzSIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-551b9d94603so1164136e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 02:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347308; x=1760952108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE7TmgC2chzOeWrOmbf8+Owl4JMPcc5AVh1uFAo2uoc=;
        b=p9mGgf9ugfFY4G0OJk5xekF1QelcRkyu+JezZf52CBOQ3AI8hD8bqt6fF2ktXBjkN8
         4w3On9qnuaTHY8JvICewQUmVxtWUT1V6YZ5orBdcsS1P1t/ymM690Vt3sFqd8JNXTjb9
         qSGMysBzkQcV4dL9Cu1xQfGx2eLenGTVMcwCKXXkQt63ihgg7jBmEjZ+ZCu2X4Yzs2ll
         rAWGQxW/BW0R5MNx6QLeTVtD1FA/X1dWDBK1I8o07JOgNO7F4wC52WgAsUVrQiLznxet
         4nGATOX2de9hGbT/OzYOqcBvr1wpSRBiqxG26xr/BWs2b/dyL7UnN3YQZoDBpDSaYOCK
         G4+w==
X-Forwarded-Encrypted: i=1; AJvYcCX9OKd7suWdnF/v35FJwlTAdaKMr726+Ybog82v0VruC/LTpTZlnunG4cVNJk+mmv2H8lwMzoA6eLPSxV6RLgbTRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvG8p4wdpkmbnw5C9wHIYDOaExUyMjb7isoz4Ixtk/FnQkPB8f
	BnMgbWzNbRDSveusnYyRmaoSjoHhlHSUpThVLSoJzB879i6VOMXwcDpEt50P+4Ak
X-Gm-Gg: ASbGncvx6zNN+/FIS834KnSlf5O8SC/DuI4IDcJV9Adnc4BWi8Of+bbCRK39nL5AEOT
	2H0bwA+vSbhNA/+yN1m/T0gCiBv5AHr7aq/n66doGcuiXMg0gG8VwbNjSXvusBXV8ZOygLgNavB
	Lm4dXlvTKgwaLh/Jv0BauaLkJ7RdCwYO+6xx2X5raDbJ62tWOyWXzJYHIeu2YJbJzWYVkqgPTmt
	5DC0MP7nf47RXda+Ki6O3Qi3AdSM3OPqnAHqbtfVdJloSzXQERETIHEK7pFmWNCBdckIeGC4o8S
	cHJWgYXQGiZue5lHs7JrP2Hmecud6ur5g5BaiMkR/Cn8mKllKh22IRaaWzDIlm39Otr4b9AABGN
	KL7Hx/SsdW1ZixnOHDBbd3atUDe7BxaHmcaUlPVT2g/CXkaPRXCUCa5gGmHaY6W1nG6LeXUEfMF
	KwIiiwOsI=
X-Google-Smtp-Source: AGHT+IH24we5oJzke5XzWm4dn7U4b3aeSmRMcUd2ZJKVgmnWh1mS/4i/+MEHYuQbvbk89FQiuIjnZA==
X-Received: by 2002:a05:6102:50a9:b0:5d5:f6ae:38d4 with SMTP id ada2fe7eead31-5d5f6ae3ce0mr4792521137.41.1760347307731;
        Mon, 13 Oct 2025 02:21:47 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930c78e5d59sm1968497241.15.2025.10.13.02.21.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:21:47 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-905b08b09f5so851612241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 02:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXx21o1eQn4fyYzTwI92bKDIId7o46ntbED838TFKk7fRIOBZ8OA5OHObav8TqPp2UzS6MFaWPs3mlHNerLDecFYg==@vger.kernel.org
X-Received: by 2002:a05:6102:809a:b0:5d5:f6ae:38d6 with SMTP id
 ada2fe7eead31-5d5f6ae3be3mr4887066137.43.1760347306859; Mon, 13 Oct 2025
 02:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com> <20250812214620.30425-72-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250812214620.30425-72-laurent.pinchart@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 11:21:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTSi6FDvsRziH9ZABR-PbtUK+ApUZCK1hGnKkCUQpEWQ@mail.gmail.com>
X-Gm-Features: AS18NWBAvXq59rhsAhQQrBuQg2NKdE2kj1vgNldRd5rxMwh2dBzQBdR_oulGrYo
Message-ID: <CAMuHMdVTSi6FDvsRziH9ZABR-PbtUK+ApUZCK1hGnKkCUQpEWQ@mail.gmail.com>
Subject: Re: [PATCH v2 71/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1:
 Drop clock-frequency from camera sensor node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 23:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. As the clock
> source for the sensor is a fixed-frequency oscillator, simply drop the
> clock-frequency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
> helper", which we tentatively plan to merge for v6.18. It should
> therefore be postponed to v6.19.

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

