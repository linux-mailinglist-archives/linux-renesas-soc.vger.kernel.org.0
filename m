Return-Path: <linux-renesas-soc+bounces-22713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CFBBE7F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 817254E9151
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD83283FD4;
	Mon,  6 Oct 2025 15:34:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC818FDBD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764868; cv=none; b=Sb+6X+h6ffC3i/OXZowP75C7pi21CJ2fUzkFxZ/AYfu5g9j4YZ+OptRI85eJT4TZwRBLsHLc5mzKWMf0R4b7qf5TEMXRD2+rJsOBg1XKkmCKEVqSf2n94QWR3QvWbKLJCOjKcHAgnJBwAPRr3KPX75F1m5iKMyVdxVdsw/gJwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764868; c=relaxed/simple;
	bh=dSnfb3yL4QKj2jW1vkztCLpaRi4oy5M2m+qzcux2G/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqWx4DuHn07o/tyUjurILowyWgj8IZO8jNMN7eOBqTWs06qx/6xTpO1+/DVubc0jCQuCZZ0SvHB8hcGBKeVaU2CHjWKWYkTjQ95ZjVhIRoIaV74gyXp0MrZf+ifVdNRTNcmGlJIBmhiJcps5HRqup6EUnJ8WvtoRsl7q+DLVZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so1744995241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764865; x=1760369665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jg3+SSfQDF+38T7p3MLG0Dd2g8S6PQVTqm3cXu4YzM=;
        b=O85BMYwc5xYtqOAdt0qauAVfy267iuJYmdoJl2a/XySBu7Dr+xtl2EoEC0rd++kjjB
         OdBnLSpo+qb7XST3llli5HHYIYxO+cIb16gpyHtc5Z4VBq+IOJyQMwBcUAc0ebuaYoSR
         dRuRERVio5458ikIViPyNS4fKbgoOGBd2IhFgcHInvaQEia3+Osk4fv1Xc14vkAZZ8D2
         t2tciyT6okWHu4TSjhyaZ0VrDEU3FErww5t7wnAJiy+dGilLc6mGyovqJNCN4z3wONmr
         nPpaskPkzhQlU1t0sOKl2agQnSIY+FKnHJYg9nzua7Bhf2HUGM3n3spS6VMaX8+HCrQ9
         0dVw==
X-Gm-Message-State: AOJu0YyiHs0pIb0qmKK0SZNSsTepUeF/XLjRQjtTLtkGzXuGwQeE5wdE
	ErMe+akSIN+TPPjyy0TiD7uPo6P1X9AoEtL092XqE/FXir6DcHa/EEVukOYObICI
X-Gm-Gg: ASbGncuBBJRPseMAnfoN56O7oqike0ocC73f3ZAdi0mVLA1meEpO3NYQPoxcLga/59U
	4xWk/YNHMAaVBzvPXCv9qvZVhu7zUuT6BtnaBNRGZcyJ4ZXjil7NXtzF0iy2Ys/pguDPAAzxx0k
	48wYDuHPby9tdLZNWvH0y5IzA+33aweMiBYpqtm0BfAv+5N0nZQGsFH2Ft+5B/7wy+K7+ZrTL5B
	sfkZbQSqN75a5Rv4bVjZO/sD+o3dG4v+iYJ5TSMO90SkPOenu5LPiqMSs205teEUN5IJnEoXpMD
	wJOpBwe9P+58kUR116K9ZBf+SgL3NTRDxDDAzxX2Vx8ZvH19eSTJCBg6QepLbYAO5akz1kgTaTO
	eKQtjShv8RGjBd/7A3Xt3ol93WMx58ODkhptgZttnYwQUwq+kPdUuHPxP1r579y1swdaw4Msa16
	lYsHfJrm3kKT+o4gQOqwo=
X-Google-Smtp-Source: AGHT+IEZNI4KbB0wjXkuV9zxASqBdS9Ay+KYwsy6goKmqvx40XNXf8CkR9P21Xr+9V8ls5FnGoXfKA==
X-Received: by 2002:a05:6122:45a6:b0:54a:a1f1:ef42 with SMTP id 71dfb90a1353d-5524e8a9560mr3948477e0c.5.1759764865092;
        Mon, 06 Oct 2025 08:34:25 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf65458sm3060853e0c.24.2025.10.06.08.34.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:34:24 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9231a251c01so2112165241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:34:24 -0700 (PDT)
X-Received: by 2002:a05:6102:50a3:b0:57d:9305:63db with SMTP id
 ada2fe7eead31-5d41d08b522mr4237667137.15.1759764863878; Mon, 06 Oct 2025
 08:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-14-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-14-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:34:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwHJgW9Y=RKyXgVwYCvJzBQc3zpRzpP5yUBcfZNAdo5g@mail.gmail.com>
X-Gm-Features: AS18NWCciT_-UK_y-k_Z5Xm1WxXKv2Abi-iS7JzUNZsCeSfXKSXXPeeyGuNBwI8
Message-ID: <CAMuHMdWwHJgW9Y=RKyXgVwYCvJzBQc3zpRzpP5yUBcfZNAdo5g@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: renesas: r8a779f0: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
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

