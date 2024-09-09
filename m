Return-Path: <linux-renesas-soc+bounces-8867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6697148A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 11:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9113628454F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 09:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D521B3B32;
	Mon,  9 Sep 2024 09:57:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128751B3B2B;
	Mon,  9 Sep 2024 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875830; cv=none; b=Kqoel0XXNlkwW7WK7r4vT0Ni4BKOIu4Ca0MrZCkbzQ18ABbIhqm/Z8uQasV1YUulsoKXtn1h9HppI7uISIk62+T1T86nYug/plkXProBVx1KyYqF2EOeCrnqFiviTU/G9+tqIDQvH9ft6+YwjygbFPH1R1ODwUVZamQWa9wP/Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875830; c=relaxed/simple;
	bh=F5ig9bVaogTQaUWR6VhKGimLjyVujzRzVzKtgAFSPW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLHBnrV1ctQ6zsCe1wRB9DqqUBV51/v3qS/GD4136+vdBXPCnEGU8wd8D7G00m2q/DZEGNvYaYS6x/S/3MvPsBrpPGTPhX40X8Q4+M3mxB+7CJIYUoHuSQMAx9GKgVysnJTObkgqITBt8HQC46vR/GA80dKRt2OpraSy4uDVTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6b6b9867f81so35610037b3.1;
        Mon, 09 Sep 2024 02:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875826; x=1726480626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpP32OtXs2KmofDCBZ/sB3rpoVgR8MDG5uMf2/mZcPA=;
        b=wj5ixSYWtgDdaUC2novLaCCWo8Kocu/fDO8i9LDYipLdJ4v3Sr6kvtF8EY8r0s2Epp
         ocz2X5OhjLzxSmX0itZd3oPBvGywgKteo4beI7HrlriJKZVfAMuJIs3mxr+rR1alVeTa
         Ukgf4ICWItoAWzWn6Hh/5vtG5mnPyjokINOO+m416JDcRC6DmUONkR+c5iZ5/1VSpzrK
         eiW2pFzdWqCID06XEKgaqDNxnzE562lnEbxlrF5O7Bawo1ESJhRM1XBE42XX6lmiN6E1
         BuSZc8hS0QgPvnCzES3ebBGQUlNUil+tniatc8KOgltxPspItJNIdf57k4t77YQD8de3
         NN/w==
X-Forwarded-Encrypted: i=1; AJvYcCUwgtZE86c+/K30q9AZVpt7e1qH32KLut16dnxBwYMuMj10OMc8qR2SRUrZUGd5zCtkUIxVPn0c+8CXw+y2qv8rUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcA+JqReVgS30dgxptA7zp2/XK2NmAKxvv9YXqHpy4dtaNnc3
	RP6fzAh2mN7nIbJRqJaUUw+7KlEbrSAzzX3M1dDVb/NNApoTJy/IwSMW2iOS
X-Google-Smtp-Source: AGHT+IEd6yukD79nWJ3Ec3qQjeZhACCGdXHkGCfZ/FbhIgAyjWMu9TbncokBVJZ4na9kfTfbh5fOtQ==
X-Received: by 2002:a05:690c:6a01:b0:6d6:73d9:e7ca with SMTP id 00721157ae682-6db45164954mr122934747b3.40.1725875826291;
        Mon, 09 Sep 2024 02:57:06 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db5c5fff29sm8730397b3.17.2024.09.09.02.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 02:57:05 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b6b9867f81so35609817b3.1;
        Mon, 09 Sep 2024 02:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXng8KMUA8JYzFtGBqiEpb43hMc0N+8UT7iyOGzFTwWZP2RgYzWCSGltK8leLC5mg7BypA8je++kuaOM11lTGh3Aw==@vger.kernel.org
X-Received: by 2002:a05:690c:4911:b0:6d6:94b2:f3e4 with SMTP id
 00721157ae682-6db44f2f652mr127588687b3.26.1725875825669; Mon, 09 Sep 2024
 02:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908211056.230784-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20240908211056.230784-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 11:56:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXw9zOYQ7kUxT8uxf4ue9ikU8mj=2_S_=j9-0RRQXah+w@mail.gmail.com>
Message-ID: <CAMuHMdXw9zOYQ7kUxT8uxf4ue9ikU8mj=2_S_=j9-0RRQXah+w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: trivial: Remove duplicate and trailing
 empty lines
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 11:11=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Remove the duplicate and trailing empty lines. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13.

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

