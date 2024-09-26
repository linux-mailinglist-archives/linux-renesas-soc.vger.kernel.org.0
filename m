Return-Path: <linux-renesas-soc+bounces-9083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B1987370
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AEB3B278DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D4615B12B;
	Thu, 26 Sep 2024 12:19:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35B14E2CF;
	Thu, 26 Sep 2024 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353154; cv=none; b=ArT1B/nowXHMaMVcsOKlorWo0v/CIz71fPF1rek2hPeuj3UjmYhTQ7TQux4BbErF7WvSB/tNX4672FrqKV6cJnZfMOm+egcYfOre/feGuazoQ+t4akBJ3kVcVzuFwewh/gPQ/elcLccnQkQMkzBEEhTekffUR/pgrbozUrsLjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353154; c=relaxed/simple;
	bh=je/bj8R9IZSJZj/Shbf8xzlPS21w30ml73hagbaJ31c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBX6xQc5H53HnjixGNg+zSJ75c7eQDy5n/4/skAgykwWsPg9Tn0wAtjEsBI1NB0V6QqL0J1gRGBcnfH7Z0+r2Ln+CgRmCOxLNEHbHAK1w0Kcg3uPX5wXbjsOTCksSn0c4T5xZJnMwNlfRbrtteYq4tytB9junCG1GDKEVU9gPQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ddceaaa9f4so8214887b3.2;
        Thu, 26 Sep 2024 05:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353151; x=1727957951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAdztSt5ZAKOoh3qUpY+Y4o5NCBmcQpzZYE2CHhRsPU=;
        b=wp23EvQeg+XawF5vu0aWVBGYpRvkKq3XloRbIookIMCuQY5ku/Q6dLbAMLfslao25R
         pHrYQ5SyXoI0LRK0QGljTtYL72kJU6LgifXmdzu/uPhXrt0hqFSCGC8clzgzqqS/KpJI
         JuaycSPBgxRvK03O1kij/mI2tt5Jq2vW51to09h/FCUrvQxaC1DJoE+ToKlIWDjb0XmI
         SVA9uMnAPe2uTxp/O1+c0Cs5GhWVzzCt4qySsI9RpNjjIcpw+23Yg61EoWGGY+ymwVrJ
         pMBokisgjheb1JdonQFPbPwvgmXaPgBp0n0E6FN2XIQNidiQwxnvdoIRUWzIXr8cXcfd
         Bh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTmOT24Bt+TEfbvvUyMBuLKMxtCDRi/MlQhtKEHs6lRKen3lpZAMswTWdB8oL8WTWoy/qiBMyMmzhy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gX1pthJqC4CV4dD8Y6UcTAoCRErPEst6NqC97huAohLZr/td
	iGJiTFVKv1DKcA2C//mz7luhP253dFAjbd6S5rhIx0qyC4JVZWi6gB9eFOI0
X-Google-Smtp-Source: AGHT+IF8ilKU1uqNA3OTSAaHbU10Lxbq7a4xEOTfvlPVcOGkwIsLRwdgZLc9DTBZ93ZNO65Y7hu8WQ==
X-Received: by 2002:a05:690c:4886:b0:6dd:eb45:cf11 with SMTP id 00721157ae682-6e228b180d4mr40896397b3.43.1727353151270;
        Thu, 26 Sep 2024 05:19:11 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d280b40sm9677527b3.126.2024.09.26.05.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:19:10 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dde476d3dfso7836537b3.3;
        Thu, 26 Sep 2024 05:19:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0rCc3bt86tiN5kzgiowcvu9fJzq74VP4wbJ1mKJV5mDReg+JRve1TJhqTB3l3ct8BO4i0Vb7S+PtQ@vger.kernel.org
X-Received: by 2002:a05:690c:3746:b0:6db:5595:7e67 with SMTP id
 00721157ae682-6e21d88786dmr54762207b3.11.1727353150169; Thu, 26 Sep 2024
 05:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com> <20240921114813.4124-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240921114813.4124-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:18:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGJhoprkj0Z+teGVNg3=D9G=MWJ6ObxrB24dZPMT1PbA@mail.gmail.com>
Message-ID: <CAMuHMdUGJhoprkj0Z+teGVNg3=D9G=MWJ6ObxrB24dZPMT1PbA@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: renesas: genmai: enable OS timer modules
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 1:48=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Driver has been submitted meanwhile. Activate the devices.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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

