Return-Path: <linux-renesas-soc+bounces-8688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23E96B31A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 09:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C790287914
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 07:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1421D38DD1;
	Wed,  4 Sep 2024 07:43:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D91465A0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725435812; cv=none; b=pzCSG1bvsmCnPF0r6fPBVrnxwVWf9kF/C6VOw7xL6aq9p2iOjEBP3W5qbJWkyuAvAcqZPLWVoVYdKjTflTo3hTfNfRDbg/vj03PqQCCAAG2m+PeDAdJKRkzJqo/7y2WjydoMtrHB7bcISK8fn8CRMkWCHvd/3vb82lr9KgsclOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725435812; c=relaxed/simple;
	bh=izpGAulDaxC7TKHHWWxK7BxTgRIl9toGvRx+CwvMpZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPYuTvUotptMwH0hPbQFlUmazyBmxUj54BxqDyMf0iJZsku74UxLjUT0n1bF0osl6cmOIvch4Om4a8NYYfuVXYBhR1B6YEz8t2FJMRm4BtEEgywCGhoc5jUpUo8hZ4KRYe++aGHRBxlMt6wA1qPy7MY4CMJx7H39MaOKnmDus9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6da395fb97aso23405967b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2024 00:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725435808; x=1726040608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKngfcZJ2CHatb4+oQxp+YK5sjsLAKBfiRrYcbgcD/Y=;
        b=tAl2g86/RYKY+DEG62pmoOqPHlyUvvTm90RZxYuVbWRWebwWp+MuVz0Jz5t2h7KWk0
         PlbutPDrT1ccsKaF26U6prvFgEFD7xVrUtGuUPNE0Zdq8VYP8dClVgL8rAnTqzUJTw64
         mhm6om09vGur2+MdwEJhmOblUlrhyWiLtpMaKC2teMECG1CvC5vYb5h4C3llEMwQH1zy
         Jn1nUVT8FIH25pTWVaFjJhmvDdEu2qOa4UT1SV5lZLXDmFtPoSEKWJ61Tx5CPlpNOnKS
         +Yz7S3sbzLsjxnCEiZd4sTx7Bp5r5AEfi9AWzdrVH83EMFW5oy8n3dfZYpldHFqs+/ql
         uvHA==
X-Forwarded-Encrypted: i=1; AJvYcCXfnXZ2Qcv5ecxB+frZfeju+4GnIcecVX0O/IhyMlpvQdNkEGwHPtn53ZhuYtkf/KGZ6tQ9f9Tkdme0UrMvvCSaCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNe+AuS+t1ER8TDMfCgHD8kvpi3dzCiI7woEcQqx58OQeguAQu
	5/onQmuc+wYasARfrWzfBKSf+kRCVMK30tQ3x5TROJ1fQPcJ5QtfFuLbYsLy
X-Google-Smtp-Source: AGHT+IFfY0pT3LTffvtDajvWbsV9bDQoc6p/x0dqp5bZMYo9xD2XdSuFztR9iMkl3TjJjXVX4QumCw==
X-Received: by 2002:a05:690c:480d:b0:6be:815a:b030 with SMTP id 00721157ae682-6d40fb19f36mr133154467b3.37.1725435808203;
        Wed, 04 Sep 2024 00:43:28 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2eaff2b0fsm23161257b3.39.2024.09.04.00.43.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 00:43:28 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6da395fb97aso23405797b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Sep 2024 00:43:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXgJFp/w4JRYkfFgGntbQ8lFykpnHIPD/Tdcc6zrARtrNbkx4BMgUDscJnL8PyBwX0pYbIa+4Ur/EzB95mbrIh8w==@vger.kernel.org
X-Received: by 2002:a05:690c:d90:b0:65f:d27d:3f6a with SMTP id
 00721157ae682-6d40da7efecmr164929827b3.7.1725435807847; Wed, 04 Sep 2024
 00:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Sep 2024 09:43:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCAvv1REa_Tr_RfJNn+oD8tNVqLO7+uJ8CQsQD=GWykQ@mail.gmail.com>
Message-ID: <CAMuHMdXCAvv1REa_Tr_RfJNn+oD8tNVqLO7+uJ8CQsQD=GWykQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: r8a779h0: Enable PCIe Host
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Wed, Sep 4, 2024 at 2:34=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe controller nodes for R-Car V4M (R8A779H0).

Thanks for your series!

> The dt-bindings patches for R-Car V4M have been merged into the pci.git /
> next branch now [1]. And, it will be merged into v6.12-rc1. So, I think
> this patch will be merged into v6.13-rc1?

IUIC correctly, the real dependency is the reworked meaning of the
family-specific compatible value (up to [2]), which was merged in
v6.11-rc1?

But as iI have closed my tree for v6.12-rc1, the DTS part can indeed be
merged only in v6.13-rc1.

[2] commit faf5a975ee3b94aa ("PCI: rcar-gen4: Add support for R-Car V4H").

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

