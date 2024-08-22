Return-Path: <linux-renesas-soc+bounces-8027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6795B7CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC2C1F25E19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA071CC89D;
	Thu, 22 Aug 2024 13:56:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9E1CC8B6;
	Thu, 22 Aug 2024 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335019; cv=none; b=RCjK2a+tw1Cb42ODO4tEKQWlTPDmSP5QdZBIAhj0GPHv1Omzq/AdsYI62kG/CSlJOJtm9QA2yQ8SMHIUAWffyyqplXKzTnyjwcTSwHMjW0U35UW3/tlpL+HEfCMRrswp9SyawLx6JJyTyP/a8AKFQWFMVYRQSuXb9dwuMLOxUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335019; c=relaxed/simple;
	bh=y2NXUkyC4MnG3RtLIalqyshDZ4CtN1eyDWcP1JHSfgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1ZewSI9MVFB4F3PV+O3+nIH3UR/TemOrHDVpKLTUoslnK0Gb4j7IqJKNrutoSll3WiuHK3o7b2/V5blGmx3yq9TXFx60uq2d4ffiXjLV5BAWUagVFZEH9aD8cDMG8psDV+e54/a+DiT3jbXd0sUKMbUmeMVjSt+RthvEftXHfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e116ec43a4aso959426276.0;
        Thu, 22 Aug 2024 06:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724335016; x=1724939816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ytMkPQTJJYRxn+j5gkRUGKU7llpfgAiAs0z5sajtyE=;
        b=NRBQ2AGwQSvgv4wXqTIJjzF+vidOo45oMmm13KxRq1Yu6iPwlE/P+zEEbDCj8HZhg0
         BjYy7/0bwxZwmiRwNq3g/0ChiN45OV2z5/P4QrdBFMPZqQEnTzSfAZJ447Wo+DJZY8pB
         iHCjOCuM29kMlWLptglS+tS11bU10J8f/KBXBIgM+EY6Yb7d9WeKqJI1PhZmtMDjx/pq
         IG5Gz8ZLcFY9RF8tNwAqpYpozK9l7xtMjUonX8U7OclGwCoEQfILE5IK5pY4Cf6PhcEg
         xvj+z4LY+c54MZ3q1D6E8nFOJGdESIsTyTlUems4HFS5SElMTPLK69D/Gg5Ayz6+OegV
         1UDw==
X-Forwarded-Encrypted: i=1; AJvYcCVRPy7DX10n4eaJJnaLJs2iPKkz6bJ57NmzQpPh487r4w0OQke1K8lEMTI9x08/HEBll7oj+fvLfm6AEcjximzcfhU=@vger.kernel.org, AJvYcCWrTJFhoICOCfyFEPe0WqePXpdfgIKL6hf0xMLEt5O0SaGpVqL9/uVB/Ti2tT2UDNU90vhY1AWiavUX@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfwKAKIFABEfOKmteMZe6l6yIViH33uVK/5Z408MQu1+117eL
	eMnMBKCG+oUlXaDk9JNmIps77KwCifG2avovKixIzlQ9z7s6O8BgwN9SFhcK
X-Google-Smtp-Source: AGHT+IH6zxJ09PD8B/vahveB0E1zyFRLYiiBWpvYSfRCNpWuXO1MdT2oux5Axzncj4WxW758vc02ig==
X-Received: by 2002:a05:6902:2405:b0:e0b:b85b:b8c3 with SMTP id 3f1490d57ef6-e16664a5285mr5745221276.39.1724335016077;
        Thu, 22 Aug 2024 06:56:56 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4638d0sm279295276.17.2024.08.22.06.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 06:56:55 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6c0ac97232bso7460987b3.1;
        Thu, 22 Aug 2024 06:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVH1iH47G4A1gs7ZtaxEhIcpkTk2+G8498Nj8uekbjllZVmMJaH4mCWwMUCmGZyTdHKH4TTjfbPNlm1KOai1cBzGYg=@vger.kernel.org, AJvYcCWnOBajQPCEii8/pT7RfiB+UyFz3OY0VEQ4YXTzZpRg+KFsSmi3QoeBNPBs6aNJBjKgxFTJrPWeIrEH@vger.kernel.org
X-Received: by 2002:a05:690c:fca:b0:646:fe8e:f03b with SMTP id
 00721157ae682-6c0faba08f7mr67090137b3.2.1724335015679; Thu, 22 Aug 2024
 06:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com> <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
In-Reply-To: <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Aug 2024 15:56:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
Message-ID: <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Aug 2, 2024 at 7:16=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> On 8/2/24 10:33 AM, Geert Uytterhoeven wrote:
> > What is your stance on this?

> > On Thu, Jul 4, 2024 at 5:26=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> >> When creating a dedicated mdio node to describe the bus the gpio reset
> >> property was erroneously left in the phy node. The reason for adding
> >> mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
> >> were probed, keeping the property in the phy node prevented this.
>
> If the PHYs should be reset before they are probed, that is something
> the PHY driver should take care of, right ? The PHY driver can bind to
> the PHY via compatible string. Does the PHY driver not reset the PHYs ?

AFAIK, there is no requirement to reset the PHY before it is probed.
However, the reset signal may be in asserted state when the PHY is
probed (e.g. after unbind from the Ethernet driver, or during kexec).
Identifying the PHY by reading the ID register requires deasserting
the reset first.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

