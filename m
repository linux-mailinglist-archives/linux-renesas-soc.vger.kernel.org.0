Return-Path: <linux-renesas-soc+bounces-22321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E36B99DD1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372334A5AB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 12:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DF3155A30;
	Wed, 24 Sep 2025 12:34:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F51F3BBB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717292; cv=none; b=p4jknZ7wGa4OMEoNMCN0QvR94ewKADnTm0yTWQkNi9sDIQQX8HGaEVyQ8skZK45NpxZvI7fM0b5cvLNio1RF6owKPePLv8030yzckYO8hsxXawfg35uxcA+ifgR8aviACq0rzkGjpDrO/NzxUc1n5c+pyGzCBM99A6YLllTVgn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717292; c=relaxed/simple;
	bh=VfwWAfLpuGLpI11UmODqos9TpOLKsiUzfr7Q1yFxZ1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/fONNRYlqkAJ0KIHVVZcMUNJGPLun6xBTyXG6maE7Rw4cQDTnNo3L+RLd1LnWMUsvbdwFdPJL9vZB/cMKqMW4B0bkA392tBY//yZrjCzSE3Qr7bOKQSORe/zuE+M737gxhDxCX+acnYgCY45cl6vxQ2SeLqmm0zmR5NSLO4Iis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-35acca93e00so396351fac.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758717290; x=1759322090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EtM0NmDXgJTrNIb6JfBeypppOPW5YnsWzYvqHm4pFE=;
        b=ai2WvlNWyx8FoALywR+eKxz3g0FKH2vLK4W719cnE7w0/R64cxDqoOGs2lEgKu0sZr
         soAjhf9qFC9SkHyEXsM/ABieKwhfxnDS9Krfde3bttjR6CVqjboM4IFfGF/jPtv7J4Y7
         usucDlqr5L18Hplo/saq4EMmcLX+rBUPU1+NNKgEau1Re3tnUAUK+c1SAR52+FO5p5Ar
         dP4uvwWPF3kafXLcyddsYQoXNnGOANWHPK4P6k1VQTrW6K0mfy/AnxO7qYdGj+hfLiQj
         pz1WpCZsRj1BqnBf5zt3xPIofuyCF0AU4wkzYUImTN0KMcEPbTWqwcrYgZVYRb9cmN5+
         MFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF4DgtqhOqalHYDZyQsWQaNRyIQioYjtqEjcyuJg5g4XfA0AhjyL8hwVVQBlzP6kkcAoe0d1TL5Lk+y7z5AG5ACg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSB+4aQM5Whlau2Hhl6xm45GZQeKeePW/KMc3Uc6ciKyJ7+ZI
	2EIW5uzSVgIZYWWH1eRNCCRlUeRvwfBZbz7o+n8g2N4MvQiYXygSsy7gRbj7amVC
X-Gm-Gg: ASbGnctdniLuPkv4L9ZMTmYI8chrUlDC8n0wNcg/IGD6gNdyXYgr8GYle6YuA//jU2V
	NNEw7IxjcJPBCWCV2XYbMRllp0MWvylGwBTT2RKKCD+KWgdxDulM2BI4veAT1+kQhczZcXU7Iha
	Pfgxzh4/8oAqO0DHAV6ihvJpc8/NtJlYo1/yblQHDD2IUYTlxOCR36wKs4ujzN6XyMasI53DkuD
	LJvdhj3q/8JXLnF4lG+UMR15ttowbnPZlqnHhVTYSXgKfMLYZsWedBK036Ql+6+AVMuOJ9AIJY8
	Psr6nHgmSFQO3frYaLyY2riLlG1K+gAcFjwpGqSYxEOTqhivGPcs6gDyAlwiRgB1E4gcKTT/qkp
	AIVcooGTLdBwwYaMNazh1/Zadc9iWa2qcV5Xm60ZVsTnYYFB9tHk3znrtWbpD
X-Google-Smtp-Source: AGHT+IHFXqpwXL/lzYI74r+K3+jXu8e984QpZzvUq2BLGbhe2vp3LateXuCiiqYAq7i/6X7RrlXe3A==
X-Received: by 2002:a05:6870:96a7:b0:2e4:68ee:4f21 with SMTP id 586e51a60fabf-34c780152d3mr3859096fac.20.1758717290275;
        Wed, 24 Sep 2025 05:34:50 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-341ec028f4fsm3780147fac.14.2025.09.24.05.34.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:34:50 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-75871cd9228so5859811a34.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:34:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0izb/ZKnZ47N6UNFWSb+ayPItWb4Kd64OAw/sG8ioemSpRKQs9WF7Pm4dz8B4mvgvIDLf8TmpN8Jt1AaJpX+ykQ==@vger.kernel.org
X-Received: by 2002:a05:6102:26cc:b0:4e5:980a:d164 with SMTP id
 ada2fe7eead31-5a56fff866cmr2086659137.0.1758716909035; Wed, 24 Sep 2025
 05:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com> <20250916150255.4231-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250916150255.4231-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 14:28:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
X-Gm-Features: AS18NWCMDKVUGKQgSB3C0NvRa7hF5DASAIBkCuYR4D0F9J6oYSce5vNi2fPDjI0
Message-ID: <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
To: Biju <biju.das.au@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nishanth Menon <nm@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

