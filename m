Return-Path: <linux-renesas-soc+bounces-22456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC931BA94EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BB1C3AC5D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88F93002A1;
	Mon, 29 Sep 2025 13:19:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A619AD70
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151975; cv=none; b=oFXXG+tjfKcEF2wMclO0RG/WcIpr54uE0uvcqzYNhkruMIPD8lVXINSfnmvi5VHpKPPRAx2JfCDYdyyskfUoVngBcRHq9LIjujSV4GA478MbXvtTi7WmkruSGUaB2hqZfsPWMnJxJd7Bn3Y/d1ANJ7drvq60dgB9QNhujoaxiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151975; c=relaxed/simple;
	bh=pEkTaCCZWG70H0lfefieqbAauc9NRZK0uyojo9a7tkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7O+ZKbYokTqTxnieONkK5r0ZAhV4Cq1ErvdWAL9X8cdnkYwDFAdcLCjTWz+D6lPhWjYD3QHB0hQD9/TTKVNh81nrA2DL3785rWQWeZogt4iqYJbYSrRq7i4gGS294RvHaiFkDLN+BqX5zqwY2ZAcFw9zvifj6PYcDFF19XF1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso3388469e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151973; x=1759756773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ziGjcbX3YxyO9gWW1bZ7XuZg1AZUgMMf9lvpy90fmU=;
        b=tGF8feXRpz7+oJlQzYPTjuL2iHWxnKJRYnxKLMyCj6lI+MR+kMzZYS7wxPG3iMkCJc
         mWrpp9Fvcvj0wdmRSvIxaSylUsZdD279MwfNIbVS4kLBgWQtRlF2Ijj35lr98t7YjSRN
         Rcf/4TmKMoH8LFAQx9gezqm2hA9YHKWRFPtjsEM7TSeU1dgBvRtqR0PPuXa8sByDUKS0
         wiPSpyAbI35p2V8Oa1WGNr521jGq2XQwt8mtU7Nbo5PmepbtOjSrl9lvO0OTN04cQnP9
         Ah73fZlUseXR40KH/F5ya6cPGh0VE3lS8A69Rn6T6QXPPDOU1LQZLFwXFxaPJFNLikq+
         9Kwg==
X-Gm-Message-State: AOJu0YyNuSdYyd4Acsi5s+CAp0kuiyKP4gJCMZjCvBJ6Da1S2Ski86Um
	iqlNMFreducX2uYWFnCT3mFAJIwheq/z0lzEsk0YLKaW68FHmtArTzap9oI+MObf
X-Gm-Gg: ASbGncteVKSZTPFxTEGegvGvpA7/Iv30VBttT9QRKWlOyMxARXDbvyr7yTKt0lUcX8T
	jRrsgSDxAygepph63zeChx4+QB/RasUaMqsx3aQrAY8ZPGji5wZj/pA9Mxpg1WVaY3UN4mXhkfy
	/EqjCzCl1zG00TVxXIN7Aop+gq/2t/fJuKkOpX7gI95qqOoBmJX/iX6IP+y9P3C5xYBtKQWu7jv
	oCa/z7drhV6kT+toHaspPM6QpsLtNEirFGDh9gyCMRTuFL8eoSUc9SxWXaXOAh2OX1sShCPjYFn
	9URghpdi+QLKBP2tpWBdVWRcPoc3RDBlxPpTA8hYIOpEgRHRJhEPCuEeHIWgiKwLw29BsQvKdvO
	LndwFvLxaDgrlow8Np2k7s/KywVcg/viMghnuJYsavuL57PQcmuYnFmddrhPZ
X-Google-Smtp-Source: AGHT+IF7nahRTw0qk4u7otrSKdR8eec1vwY7VLl/UgS7X9ktVz/yTnuu/u/tFhN9MAfZa6HcM/TNnw==
X-Received: by 2002:a05:6122:7cf:b0:54b:bc2a:f58d with SMTP id 71dfb90a1353d-54bea1b541bmr6384072e0c.3.1759151972945;
        Mon, 29 Sep 2025 06:19:32 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54beddf9c76sm2383910e0c.28.2025.09.29.06.19.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:19:32 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-58d377d786bso3258150137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:19:32 -0700 (PDT)
X-Received: by 2002:a05:6102:1165:b0:5ae:f88:23eb with SMTP id
 ada2fe7eead31-5ae0f882444mr4172157137.30.1759151972263; Mon, 29 Sep 2025
 06:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-24-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-24-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:19:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYkge-itUd0P=twQMRcOq-Q-7JipN2b5Pisw1eq+h80A@mail.gmail.com>
X-Gm-Features: AS18NWDYOYpwpVM9qncESnIW4aPmEZm9f9uNFviw27svpxW8G9fKGF__7TmdRu0
Message-ID: <CAMuHMdWYkge-itUd0P=twQMRcOq-Q-7JipN2b5Pisw1eq+h80A@mail.gmail.com>
Subject: Re: [PATCH 10/12] arm64: dts: renesas: draak: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> Draak boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
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

