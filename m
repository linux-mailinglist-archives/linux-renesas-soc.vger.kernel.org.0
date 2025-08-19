Return-Path: <linux-renesas-soc+bounces-20698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1FFB2BEA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 12:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 018B83B2C6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 10:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95EA321F38;
	Tue, 19 Aug 2025 10:12:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBE31CA7D;
	Tue, 19 Aug 2025 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755598331; cv=none; b=QjjVNKj1Rq9oacuFC0TTMDs4++RaLU73frCclphJBHdMMkFI57IwSJMEyizBLxIJJXyeezcb11c1bjaoD5YQEIBT5/CYbNzut2p2LZNVdON/gNWTSJX4mPsnnScpaopX/5AS7VsL/b7cTlxLpZ4ca3u6JG5K8MsTeqmh1vhNeEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755598331; c=relaxed/simple;
	bh=wE1DYNNo+3/fO9zHF3kBdJs911lXF+vXWscl2/sRyGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke0ilZ0zaIyIVOpp0bpuGqil167Oa4SYtwc3kosm/yQs2/sgMZGXciiO77sQDvFfTH8oOrnSDGYE2RMASuAkJq8zH+IrYsTXF897bFbDNUTs0osYj8vS75oAEqS8R0EKgOxPON+nyVSgOmaxRRiCumBBxKCws/3e/OwceLhPJuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53b17378b74so1886383e0c.1;
        Tue, 19 Aug 2025 03:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598329; x=1756203129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mycHp6qSRzlcFd4YjpHc32Iz3RHm3l/TUwPIdxqYeFA=;
        b=SmXti/kN59gKJ2CI6PX+QkDmX4+WWlix+VSArHdri3fOnYvBdg6gbQiFvt6VXFrFQ0
         NDviV21ihQ3xIWwNkXyeC6LUee7gvBOUMFMVAakzuLGxedF1xrz2OvWxvl4I3qRw9qIr
         FHq5zrOWvOIM6zmZo94nazr7Ycp1e78r7skxo2+Pua7v9Alii0MBhcHaA11MyqcLRpif
         bbhSqdd8JSP4Ri9z86DmfznAc9rEordGKVZwWTR6tyDhwcJJVfl3AIU9i3gJD63fX5wY
         DPySlKBZ6HgHqT2h0T39noaBEKGDPzp52Sd+7kIB2BD24YJZun8M+bVxZ/3uRQ2Tbijt
         28mg==
X-Forwarded-Encrypted: i=1; AJvYcCVHfe/zq2KqOulR8skIz8EDJRLVZAtX90IPeDdEndUjxP/+gQoMZTDlETH40xkSPMJ42K7reSP1y8y8@vger.kernel.org, AJvYcCXiWOCyYjLeIH4ty9/NALpAfqYEm7WgTuAf1p0qZrJndK6sIDnShi5p3zVa0PjSOxbAi7oGr+4nwIMgscP2/1z3BG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxccLpPtWnx86RCZAhK3kmOP3oaD4jagIDMwzheRFw130TPkuRg
	4wuSD3BIXAPY97SGdQyHgk2Ic9JvRJDNx/dTnWF4NSOmEOEDgCau87N6YtHgEsPK
X-Gm-Gg: ASbGncsl2pFUIeOOSd6yYNMyA+hLB4PLgkymgDgkjcwPgaOEKz/K2vcCkiMNNzgrD8u
	y2ofaK6KBbOT0QR36JxpOv1wk05CdUsYNE/l3skilOgXYxlZQ0lvJJ6XMsIyVoDjlJEmzPYFD8r
	7KOrHCbLSAfEjhdyCIi8a0Zqv9zreH5Jkm7Y7gBXd5D/LcCD5wiULe19uMnRmWynnaiYdfemMIl
	s6lk5SrcQba1tUz8pFr8bv5wO0v/5GEiufJkJwztYDzNYfyV8lbccT0C43wTwDyONFLacMXVbbB
	GIuAoYCCIsDczrROmZGTCnnEU5VcDZvdS4mnlOUueLdMGmj5oWFFr865k/OuMtJs2MXFceBEBHg
	+Hhdv8j3qM+Ro2tXnujMGUkpE9PHFXR71Qf/qljsCJUgw5LZvGocK4v6HRCYl
X-Google-Smtp-Source: AGHT+IF09AH/I1UoKmbPqHsfogC3jFJMVxtjjQMYISUoHKpcG+I9z1eCUrMaKTBTRqxJ9m8tUHiPMg==
X-Received: by 2002:a05:6122:1d8f:b0:539:3bb5:e4c8 with SMTP id 71dfb90a1353d-53b5d31388fmr604932e0c.12.1755598328729;
        Tue, 19 Aug 2025 03:12:08 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bed9fe1sm2683422e0c.16.2025.08.19.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:12:08 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018fa6f6dso1548419241.1;
        Tue, 19 Aug 2025 03:12:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUctM0vWXRJPQsvmmpAT1vtfEf4oBOJkOtG8ugdU/Zq+8GNfUld1ZUfjiYnznPYXleWCW4VdRbiEuM1MNokA8p19Cc=@vger.kernel.org, AJvYcCVtHrKs+fEUHxk3FE6U18c+Y/mUz9sG9aP5lvejjMxjLGo11tqBIvCUzRJeKy1BTQK8FzVe1ITk3WnI@vger.kernel.org
X-Received: by 2002:a05:6102:548e:b0:4fb:f2ff:dd16 with SMTP id
 ada2fe7eead31-51923a25723mr489752137.17.1755598328341; Tue, 19 Aug 2025
 03:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806192821.133302-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250806192821.133302-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 12:11:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdM2qd_DWiiPr2OwX5=nf1UBuHRUX5Za9P20XPsJG1xA@mail.gmail.com>
X-Gm-Features: Ac12FXzJGw-LH6Umblaudi03B5kX_ZYvIGSqV9QE23hvFag9FOrGjoyEvIY4p5g
Message-ID: <CAMuHMdVdM2qd_DWiiPr2OwX5=nf1UBuHRUX5Za9P20XPsJG1xA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Set VDDQ18_25_AVB voltage
 on Retronix R-Car V4H Sparrow Hawk EVTB1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 21:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The Retronix R-Car V4H Sparrow Hawk EVTB1 uses 1V8 IO voltage supply
> for VDDQ18_25_AVB power rail. Update the AVB0 pinmux to reflect the
> change in IO voltage. Since the VDDQ18_25_AVB power rail is shared,
> all four AVB0, AVB1, AVB2, TSN0 PFC/GPIO POC[7..4] registers have to
> be configured the same way. As the EVTA1 boards are from a limited run
> and generally not available, update the DT to make it compatible with
> EVTB1 IO voltage settings.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

