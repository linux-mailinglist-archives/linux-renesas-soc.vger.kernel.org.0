Return-Path: <linux-renesas-soc+bounces-3781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5787BE89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 15:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 207CC28795B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 14:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6596FE24;
	Thu, 14 Mar 2024 14:08:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666BF6AFAC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710425300; cv=none; b=D0EA20RglHbtN+SFWpVE6g6DBkzvohoJdsYAvTtQj3kHkNi5YNdEymP5cJjqk/sBi7bF0VVMgFuPc+Dyy5j8ROdX9iV5k3UdrvUK+kPSqUxiBbRMZf3wNKxgclktacb9KD2WHi+W1AlKSEqeprTMt1F/S+GaycZc7CcTIXt3xX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710425300; c=relaxed/simple;
	bh=41p0et9v0YQLrjM5gL1eoK2E/DE50+DxYXI+/B7smIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aj2+Hi+xDjvOsT2LuHsYlZFHG8NhbgCl2oMnU3E3LCpKMybJplaHvIY+ac6O/3jtELQhzx93gRGmBrLaeliUXNl+YLkVHh3M1WMqM5e5OlUi4yclBnJmFXRuzPJPbDh/nzhlIlKxAqeRx1npI+xKp2TjXkx8r9IIU2vbjzXDlKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a0a54869bso9321607b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 07:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425297; x=1711030097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM645ydXW/6ZfqUrK9gS7NMHxLk4mTczZQsArUjFpj4=;
        b=I9I43mRy3h4S98TOdZgFF48eb17PdNEqAvIeHBMLQW4IN7kl3wsJ7TpiEHzdrmmnO5
         jPyLg7xbfTPMy6nq/zwGlltBVvLv+4PKpY599epZ+yinyGw5+oei4pMta97ulOYA0q83
         a3W+Tykh0j5rKkqL6RTKHkfGQ2mO9fRU4I/1T52mb6Wfr5WpAN1QHkUigDJLeoc1S3f4
         MLwjHZTK5tTPoRPFBewquNHgDl+XlUM+8vcwvKa7sFINlK+T9lcaomT2VB8OWAZYZYab
         yCOpnMsLaKJoRzlguJlYGCvb39WHpGJMrYyZMTEuNoE9/XHopjyeaqesWmxyXrmnClbV
         pNBg==
X-Forwarded-Encrypted: i=1; AJvYcCXzsHGeDvyyJmgsbfy0Mbah+YK3uaA/CFwW1f7przD2GPoWHHvGaZxEB8XC5jEx+0ChN/W8Fth1pa+D8qDox3T4dZYOFWKHvfw4MjveEDiL73w=
X-Gm-Message-State: AOJu0YzR/BWN3tX0A0HnnA7yCrRlg1C9OEikkt3LyILSlqSxEryzkdk/
	YE5OMv50yfdok8seuAKW9S/NZyYFbUeOxI7CljV9CKMoMGjDjt1JIOpb03OQ7VY=
X-Google-Smtp-Source: AGHT+IE506D/1D2Rv+ejzUWzLG6lbT+Oi92VxqsR2ToFouyMGJR7OkICphmAEnMo6kqG/xRgjB0vJw==
X-Received: by 2002:a0d:fe04:0:b0:60a:4930:5bb1 with SMTP id o4-20020a0dfe04000000b0060a49305bb1mr1070147ywf.5.1710425296762;
        Thu, 14 Mar 2024 07:08:16 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id t13-20020a81830d000000b0060cbd86ba1bsm288537ywf.12.2024.03.14.07.08.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:08:16 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609f4d8551eso21307417b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 07:08:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6cE7JKxjes+eM8qpFBwQ3h7cqnDm8zfXeoeN9yemgOQSA0dzZuwZqQrz6eEsuMRkJIwmIcFVpgybRdI+egvGiuCBUeYJ4Mx6j9WRx6g5uWHU=
X-Received: by 2002:a81:4987:0:b0:609:ecdf:7c9c with SMTP id
 w129-20020a814987000000b00609ecdf7c9cmr4215671ywa.19.1710425295989; Thu, 14
 Mar 2024 07:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com> <20240229120741.2553702-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240229120741.2553702-3-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 15:08:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZz_F3YWAWfpF1uzHL0VOG3ekzAeoUJBMmMHZpQcoxrg@mail.gmail.com>
Message-ID: <CAMuHMdXZz_F3YWAWfpF1uzHL0VOG3ekzAeoUJBMmMHZpQcoxrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: white-hawk-cpu-common: Enable
 PCIe Host ch0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 1:07=E2=80=AFPM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable PCIe Host controller channel 0 on R-Car V4H White Hawk boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

