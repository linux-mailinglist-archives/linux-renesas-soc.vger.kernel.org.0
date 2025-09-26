Return-Path: <linux-renesas-soc+bounces-22407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F0BA324B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400A13ADC4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D6A1A9FA4;
	Fri, 26 Sep 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpMCz0UE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7528BAB1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878868; cv=none; b=LdnYWzqIewo/R3xF+8zZfmFkQ9th3J5Q4J5RsSDpCWBcE4TuPy57d3jVg8+PcHGa8VXTAMEIjBsyqfg/NlxB48plKD9+MSJ/+Fd26FNJglK6fesaou246OQktlH3VM3yTqjFUmKGTnOofZUKQpTaqSHufheQW1HI8U+qiwNTRCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878868; c=relaxed/simple;
	bh=Z6Hnsoz84c6h2m6eIKTTZcoeM85kYrOQc6fHsPgzlQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olB/pv+vZo+hC9p8pcrXRsDFBr2DQACVjzL6YQio0OjqyxBgXzcFGQs3MfF7vj7eQqbT0eMHf9CYMX/q5c0+AKmHcOrER+3pFTucK3MM6NgRB/EJE1lP67EskZ7Hf/UtnMocSPD6U1yTrxK5bWOD4w9qjvspM9gNm6LCk2iB79A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpMCz0UE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso1384070f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758878865; x=1759483665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB1opI8bybzoQ7XA3qFmUiS8+gAzOLrKS4gdS3fw1Vk=;
        b=FpMCz0UEfmyaKcWBuiuZyQm+Lca9LDJM0R8oAaFSeB/97lYJnKPlW0n8e0HVXyH7xj
         bJVxlxD0i3VbwL+QIsVMEPjjU1iXNPWGGt0s9d7vS4YkAHwKgMuWQj84L2RiyV+aLeqw
         cws71N/kq5pi+p+gu0FzDUdtuSuj0RSD+4+t6TmtHXMad8yLEMxggcIM2Ce1NohHn7Lq
         XM2YNvfRNBSltoUZmpwdDl/FevCX5VzkWbcrrpvI7AnHJchcSayKmpZcVaE1RB9aWWGO
         xzHzmrxieyxVtVFxi6XHBTnqDrS+UyWdsHGGjUctAJmkn+BP+f18gHO6Of8uSJuHino3
         W+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878865; x=1759483665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AB1opI8bybzoQ7XA3qFmUiS8+gAzOLrKS4gdS3fw1Vk=;
        b=OdjCzaXCHcKhJC3ZCU/6MLVyCS/Jb4jS1jtEIL8+UJoBpdoyGjb/MaJoDVZaRCx3Om
         4hDe46b/a9SFAWU87MmGUBDYogQLx7RJZqWjMVLYtRQUrYTlu0Z1ez7+LB+lfzqtzeIM
         oZeTjTa+ZlPdloYgu6m5JiPblNoDqAMqgCmfth0M6aHjm+CSJZMCdFld7DCLfce1wpui
         sOuUBnlamXFpdubx/CaahDm0QwYK2DbOHDdf1d5XLAXZDjHQYW7ZWa11YO8R1FxJp1qC
         kIG53BC7YDL5N8HEDytKXsWf06yAmKx3vlwCm+Ao6lR06aogX0ZZBewEASD8ExerKDr6
         cdHQ==
X-Gm-Message-State: AOJu0YxpDwCIaL9Ch5SAsOg940ihuwV5/X6QMITBJt9IWcgUJ1tBh4V+
	8Wsv/nDCuG0oSSvwJvG443gwaYDE/5tylmZhrgUlVLRt/MZBQew2P+aKKTnnHey+s//VSJeMqDj
	7sJt17poCdnoDWnsEpGJ72ghCgPYlEjs10TB0
X-Gm-Gg: ASbGncsdPPPUr1xMbYVaDXQOim+yyP64chI/gSyiRNTkiK7HC4+TAXYQbXjjRGn/YU8
	rcqQhBqnskUq2SihAcusdYxi5CaTRIg0hDbQPVtpPs+hPSbcKSeR1cJKZVLrm/p7ORWykmbahUB
	k/vinjYIK4lBrR2pCcDMpPO2olO4tWS8R0LfoNmsvqoZG2pQp3gQbXYp9hRA7d2zSuBEyu19tBL
	gJh91jUsA==
X-Google-Smtp-Source: AGHT+IFXATkXGImDOHHOS2ok/ZTxgz66meQgbl5ygRsDSg/E1W7v2yao3peI7J0LV+xiNSpGg22PNL7z5tZhnlo5wDY=
X-Received: by 2002:a05:6000:2284:b0:3ec:b384:322b with SMTP id
 ffacd0b85a97d-40e4ff19bebmr6058177f8f.46.1758878865056; Fri, 26 Sep 2025
 02:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNZYw1yyeckqEvDT@shikoro>
In-Reply-To: <aNZYw1yyeckqEvDT@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 26 Sep 2025 10:27:18 +0100
X-Gm-Features: AS18NWBV5vmmHjbjQi0L_wk51TicztRu_Iq0NaF5NcFh6vtP7aw9_xOrFU2IzGs
Message-ID: <CA+V-a8saJr4U3gPzJKwiffrQLEUK80be9PtJh5LnuXAg58J8fQ@mail.gmail.com>
Subject: Re: dtbs_check warning for RZ/V2N
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Sep 26, 2025 at 10:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> 'make dtbs_check' with linux-next gives me the following warning:
>
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 =
(renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 =
(renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
>
> Is this a known issue and being worked on?
>
Thank you for the report. Yes this is a known issue on RZV2N as its
missing ICU support (Interrupt controller support). We are working on
adding support for it.

Cheers,
Prabhakar

