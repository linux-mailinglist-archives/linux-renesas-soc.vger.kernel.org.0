Return-Path: <linux-renesas-soc+bounces-14496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7860A65049
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 14:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9048F3A5B27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E6123C8BB;
	Mon, 17 Mar 2025 13:09:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE18F5E;
	Mon, 17 Mar 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216970; cv=none; b=EL5uLi2tzc0fnAnO2cqsHiBTh0cvPzTQzE0yj/CPfsaFwNHLlPZVgSUE8kSYbv6HshU4c0norNOQ3fmXEfmpTP0wZP6bGxPK9SaAn6oluFdp6pEeZ6OT4WEXeP/c1YQqZcyogEDTwtDqhhw2Sn1Iy0rateGgcAv5Z6JCn+N//SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216970; c=relaxed/simple;
	bh=WK4jCHcoB/NcyW/w3QGZ/0KBCvY7QpmJfoCluUmq/K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC82jIeAbtrhP+27aoPP2yIM+xTmbD4Mz2BVUWdev9bJ1RKlUxjlcDghV81CQhiqA2sdM8NBgUqWPSlJAFsX2EEWgbdcJj3+dHyfsdGhKncrTLMRfLLbDRSmkaYT/9QSSqG/K1pFbTDmByCqBFnNoyCUSJ1hmcmiadjB6VaeKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8fb8ad525so39813846d6.3;
        Mon, 17 Mar 2025 06:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216966; x=1742821766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtbTnvmiP4bx4iOjl5tq+F4cbWROIjCVx5OCmLqCnqY=;
        b=mz1/MlUiwV8uE0RPM/dO8MeRspdotp6wKG/nRq0tfZM0+3xePIuqcXv0vUujRvN5lC
         bxovRRL1oIgtrEL8xsBjELENxYO+aYDkP/+KrjVwb4iWqcUfzMcYHGJfwKIUHD88rWU0
         wSRpcOXr8CMDu6uea7+Vxs+sCrDHE2y2s7kMrgG71RoqwJDrhFJeVz2KV9tgchF2zhFY
         41xTI1n7B35FmI6KSR3rIbaAnrBnoIm3Y4OiA4Qyq9nmvS/QRymy6/QDFYdKRaQdkbVd
         Pu0JmqWo1GQxsOKrqawDb3LR9SYBHiAl1sWrH8/EOHYyiZwBge6cuMrY/3W+H8tVfrU1
         dqew==
X-Forwarded-Encrypted: i=1; AJvYcCXSFo0gsenGZcGhD/2ZYISOS0N2vSdSp3KNL+cs2+EEBy04boyvFsOnvk9Gjlh8m2T/awdgE8rsRlLI@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwZrxfxt3zd+aFBS3VDUJctHOTMzlTXXx7eu7SbagGFHwnOH5
	bm0HnzquONkB2eygikjUc0nOQeovloK6iNE2mcVoIuUmespoXvU+2mRKEF5w
X-Gm-Gg: ASbGncsqDwUtjnHgEKSRpSMnxMYzs1eOfLg5eCL5MV3oiHBziWjc4rqllJenBNXcDSG
	wQjgAv+cDGIfnxzq8XaHzzDEn/AUEy09YrZy6iuYscN+SYDqGbT8L2T3MsjvV06taDc0fKaBpw2
	UloZ5HhM+3O7NNpZjLtOhLTAmwySqiGupkkd8W+aALzyade0BX3AYZGcO4JWWmupbddcRuJK7z0
	LAZJSfqT4zOaCzVRObM+W+Klg523Qa2obLqPmOKRWWlwsDvcoYvWnqV9jmmg7Rq1ENxdiVT88dE
	AyzkAkSSdWT6NVfZsUEqlV6tJ5Y2LNnd1IQk9IbOA+EAJkjEqsF0Cr0GfL3jAJaKJBUmRiyicyX
	ndfqOFEA=
X-Google-Smtp-Source: AGHT+IFcRGCTcAy7uHCcusZQGAVU7YhybjGNOBaB1IR+o4I0n3T9ZgYwiHkwT8niBWNQLsIRRNZm/Q==
X-Received: by 2002:ad4:5bca:0:b0:6e8:f2aa:a8b0 with SMTP id 6a1803df08f44-6eaeaa26867mr181129246d6.18.1742216966105;
        Mon, 17 Mar 2025 06:09:26 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade330c52sm54523916d6.91.2025.03.17.06.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 06:09:25 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fb8ad525so39813466d6.3;
        Mon, 17 Mar 2025 06:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWErUa92juq7CUVJlTuCLPjxdstMYDhL+jMIULlNlipPq8ArbxmNdNcjhx239mydTZPwIbobWAdQt1l@vger.kernel.org
X-Received: by 2002:a05:6214:20cf:b0:6e6:698f:cb00 with SMTP id
 6a1803df08f44-6eaeab09fddmr207524016d6.42.1742216965500; Mon, 17 Mar 2025
 06:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317120356.67609-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250317120356.67609-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 14:09:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2eFVxWnSgdKvA9qRVg48mHzh59Ok=ciCkD8PAsMUnCw@mail.gmail.com>
X-Gm-Features: AQ5f1Jp9JDio910iymgabLS1A-l7gPuoPSq0jwD6d6jVfuyA1aHbup4gJETHE34
Message-ID: <CAMuHMdU2eFVxWnSgdKvA9qRVg48mHzh59Ok=ciCkD8PAsMUnCw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: use proper ordering for
 UART DMA channels
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 17 Mar 2025 at 13:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Commit ec956e2c6f4e ("dt-bindings: serial: snps-dw-apb-uart: Switch
> dma-names order") enforces "tx", "rx" ordering of DMA channels. Adhere
> to it to let the dtbs_check pass it. There is no ABI breakage because
> the Linux driver never expected a certain ordering and no other usage is
> known.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Looks identical to commit 5f7ebb81112c3f50 ("ARM: dts: renesas:
r9a06g032: Fix UART dma channel order") in renesas-dts-for-v6.15
(next-20250224 and later).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

