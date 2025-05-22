Return-Path: <linux-renesas-soc+bounces-17354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597DAC0857
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3B497A602F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9682221FB7;
	Thu, 22 May 2025 09:17:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39277219EB;
	Thu, 22 May 2025 09:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905468; cv=none; b=IdNsGlbCrc3vV/1iyuJSrSydW+fOnZzd7l07eBL/wZEGYrk7nWKGew3Ua/jbVaSJyqg/z0vQvhpWF+yN7rTMXM+x4LfVdM7ErWhX/f23H0RFNKmyqyMTw0lJwXhhjV4L/H/+LauxfcvcJKci1+zJ0XiAV81avmI74Po9IXGSTqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905468; c=relaxed/simple;
	bh=HSUx6qacFlsNoVXztbzW+1krhTHlX/wYw9+bh9Z/sbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtZ20O7ER6Voih3ACUglVwS4iuknKl0JaaFehbEZd7Q17wcIcefz+MMkEpOtO3Pep2vR1CMfizSXRlfgrVFjZHq5V5t7rl71KFReVrE4666hHIMjvPflFnsRuHkoDKRC2PutLIAHKMnBCipyaf1RfDqpQXOavzptCVxrr/Zpc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52e728960c3so1733369e0c.2;
        Thu, 22 May 2025 02:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905466; x=1748510266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDLgNDQthld98uV/bKYP2veOUQ1O3B0A2qf/QehmhkU=;
        b=MymHLdQI8jCecyDhWvMVR3hvPN5o+oHLTheH3NtDhDKemwde1vAAKOe+tVMnHdoH4O
         tE52Npwg/30/2I9fprmoUSRUtUIWu5iv6d37dBOJ1RybbIe95lHR+Y7TMVG7Q7ZXgak+
         xIkE1zRZaiN/3/3AyRyQUGIfA4kQfjrYVXUMxJ7KEJyTrKyly1cZA0ONRmdJrmdb4qiq
         dfPhCRh8HTESu21DHPezdcngjkkrXT+en/wiYT1kUrV8XmuNYZet+gf/acLcwNhBSuk+
         0+RQwjoFqDjjDMP2S8/kB1b96h8WeFp0fvk4cgBV1Qo5wM7JvCeAJlRxHhDm2ApfyX6x
         1tUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9yVL4ZPBzyCHP0X4owNfW1vceIkFbFmP45440wf/f/HUb00kOir10DjpsM+/nRNFAzdf0NRaeUsIpH3GK@vger.kernel.org, AJvYcCWdbwEv7cw6+adWu+e8tGITNnVoKzyI8zQH/MBwdq+nqP9jfvKcotBqSV9lxOYJg6IbimCYpMszqeSz@vger.kernel.org, AJvYcCXRmwTrT1zddnUcV6n4EX6H/o3eI1FnMAQZZBnhn6SCsxNKzf07l3ykRqQ97R4LNH7RsBPy7nBT7C9eXKeQNEJc7Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsf+Z77vhNaoH8atz3o/oK7es+Z1ivyzP5X6UoMO05N3250Fn
	4U5HdxX330fkvZBryzHS1Y/NJB/dwKn9J42Fut1DSdr74g81XES12VhdQBxh3GER
X-Gm-Gg: ASbGncslLliLpnmKu7pPvIW/itZKDJ9YgwWIlMp+E4aHywOVDlGKaZxekgfydBLMAmR
	OZesB3UUQ8IL2+LYYU952RGJYoLsw78cU3pA5xDVxNj35nsruptdwi2ETkJMZiQTMqiiFeQnbH2
	fQ+Fa2mJPGVy3yhgQ1rrznFezsUqaRsH7np2kAePvT3B87hGUd+Pn6VJr8VaH8CvJk1RlflVBaR
	jLC+kthl9AkVUpNWyq5nFYzPLFbzNpg21A18jhag9bSXotQvbIB2WEz3Gwo8bV9EzubTOPwotNB
	bdsbbemkqo09aihznoW0GAJAiLjxFs1FkavBXI5skenUFv1xxQfI9fIDzXdHw4KqK8FIkYiFINu
	eqE2R1ki4MjzSpw==
X-Google-Smtp-Source: AGHT+IGyLtIE8DWOgT2ksh+2llrhQIPmpAdHIXbEfT49WsFJKjpBeSCnNfbu3WtqJJXObgFTldvRcg==
X-Received: by 2002:a05:6122:8c0f:b0:525:aecb:6306 with SMTP id 71dfb90a1353d-52dba970130mr21797748e0c.11.1747905465743;
        Thu, 22 May 2025 02:17:45 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4ebddsm11449210e0c.33.2025.05.22.02.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:17:45 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e130b8b9acso2297786137.3;
        Thu, 22 May 2025 02:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEPzqpGip3ohJZZmtnH78Z+3gGBev4vIeoSb421O/wOer7aPwtqJTEo82dajdojJLzXDpLJLayeky3KcfNG3YaslM=@vger.kernel.org, AJvYcCUIImaQE+wqGWIr99xnXE+4ORLu9b6XAHzZMqP8wCSfICrfTZ8uEi6l2HghVoRLYgWkPPxU64x15U7Rn6Wd@vger.kernel.org, AJvYcCX4gSkGLL2OaRqYFan7WHo80weplYsIreVZcZezLqkide1bmPu/Z1pBzmwxJ1ZTxY4g4eqPbU0Ho4UX@vger.kernel.org
X-Received: by 2002:a05:6102:5798:b0:4da:fc9d:f00 with SMTP id
 ada2fe7eead31-4dfa6ba8da8mr22229082137.13.1747905465351; Thu, 22 May 2025
 02:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 11:17:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=VWJQis+pnz34aRYT+z55uDouyK2+7nkiy-HX-QE3TA@mail.gmail.com>
X-Gm-Features: AX0GCFsEN46Uz_6vObEQBTbh3NaeTfTBRkp2Xkfca-7F03gFRNItOXAVWENFqRs
Message-ID: <CAMuHMdX=VWJQis+pnz34aRYT+z55uDouyK2+7nkiy-HX-QE3TA@mail.gmail.com>
Subject: Re: [PATCH 07/10] arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add WDT0-WDT3 nodes to RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

