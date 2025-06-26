Return-Path: <linux-renesas-soc+bounces-18780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB6AE9D89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8511C427AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6F42E11BF;
	Thu, 26 Jun 2025 12:32:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1B2E06E4;
	Thu, 26 Jun 2025 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750941123; cv=none; b=QsBnwBha0H96EeItJCFJzZxVqqHnVCy1cI60mf8LzJxasxDyHG3eaq+TaCxK6pMszpO4jgkTyQbx3a8gx/RT9b9Y2is0V+la0HeOovFTMJKRWMneTz2axjoruvFY1beNfZkpIZzobQ4RTC/vRXc8dAJI2zqkfzLmgDlA9QzfNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750941123; c=relaxed/simple;
	bh=R406E7aTx9nftAo+npNCuL0z+9TS/Ddep2sOGrAWnJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LX88ySAfAeTRpnSd3Mx8qGmJD+Kbfd2fZk54B5rX3+pz8iBK2bbMNA2BBru4BwIGIMez7NaNTnPkjFxaw8y204l0uhuA5Dbx3wXsaN9eQTc+c09nwqXvZu8BA7CQ3b9FPQttWwTZvgn1GwVgHz17nJtQEncPbcjHH7nlIKP2OHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fafdd322d3so11162126d6.3;
        Thu, 26 Jun 2025 05:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941120; x=1751545920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxNrve9T9gi+GNOSoG1/RnrvLgc8XNYEUQ9CWlM5sRU=;
        b=Bpkt5iP379D8kG4dB9VWH2BZovjCxFjln20cMse3LhBPepqljtMH+/Y4xthwuo0kI8
         CmZA4meydIcZY5EVsru9beEFhFhs58ftA33RpaxFkJzQ86/1w4IJHIOxA7gT38JBgoHH
         HcNUyIUO2i78d1ZeRpOkUYgiJbNa66/a6nNNiQusc2oO18Q/By2IlEFF5z2HgepynjMB
         0VhJD+n74J0S0pK3atPdwOGrj/eY3GREsWz41i+kRbMUxDOvrWBFdC/vTilA9nv60wPB
         rlT1gRepv9XMF4dpAzatVNZ4Tk/q0KFKoSTRjb/5eviNRcPD9zP7jpm2zhPnjy5w+I3F
         gsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/n4IShENGjsYFEGkzBee5kgoheGKApUnLqKKNvNBHwLkmRi12wGuB+yl8nGfDohKVHwaD0POZgIKclEoFMctWxJI=@vger.kernel.org, AJvYcCUbVXzkj5BN0+LREGTBctXD8suqWE9eFLPon5XoQWbApiIg5NWxgJQxX4fyBnleGxSM+zRC9eq9FXnB@vger.kernel.org, AJvYcCVs23G6sz8bo3C2/K4/r1Cy8FAWKzJoth+yLAWL8Px/Ox8WRFRibXhj7tvVrPG4LN7FzOd3skk8Ltpq@vger.kernel.org, AJvYcCWCa0wN8wTrlxi7n0ayq2r04jm3hhnDlWJ8KHq4SOX3J9phZAuxobA59B9KgfJe6z/8xnRB4bFI@vger.kernel.org, AJvYcCXbU9NQEUs0JDPRbXJLNjZi4/BSu57cOCdr+S8lJaX9G/bencIHPNn8jVaZFVCEn/Zf6/SJ1oyVGLYZ8Y8W@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6OSLW+O9L7IT7hzRwhr5CHtat+mN7VxUY12y/qgvAS7VtHSI
	vLTAZ06M5WNicprycefwW4BiCQU+1Vz2WTfnDc5rFuUtoQhSWhRx6JSCMZYlmg7I
X-Gm-Gg: ASbGncvwul51AbqyFSpUXYvs15n53rxczdevIy9f5V98U44PJA4AjwyNTXPWqzQCiHo
	gDkIfHJN7xrlORDErRMGNzkWUkRqD3cl4NpODp6ckNK6VagMgojVJeFWd4Co6NJgxonshw3l3C6
	ohopiclzF3hePkdhRVXtEA265AUYYRpx87/6/oYunaRDX2yKmOS36lC38OSvlG+O7O4dCJjj1gm
	aK1Sd5NtUf6TQwthF1K5II+69Yy1pDfGJVz+ZZ6RW/HXzNroAtyt8KhnU0VTLXRQNAkrFr0hSAX
	Spp7SqsVN47sGg4BE4JPHWdkF1KA3Pt8YZYYwYNo+mVsUwrdZm3UeneUJAUYKbXls/wEsKN1ztQ
	BFczd+BIs2NoZ+q36LrVc9EDT8Dpvyeh8bqNJswM=
X-Google-Smtp-Source: AGHT+IFMcDhs+jApIf22vPRkqGanag5A9ET+xYuh/7vx5BXkZHmFaIrdwkf/HasdLQViGtJ5HHwIQw==
X-Received: by 2002:a05:6214:5098:b0:6fa:faf7:7545 with SMTP id 6a1803df08f44-6fd5ef8c915mr122820756d6.31.1750941119247;
        Thu, 26 Jun 2025 05:31:59 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718f5ddsm6815056d6.14.2025.06.26.05.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:31:58 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d0976776dcso96907885a.2;
        Thu, 26 Jun 2025 05:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1mf2/eEv0M2yPeHYJa4sIA+z3A6HHPjbUpVtk7xypL4jgewEpM3OImPOrBy6ucP+UcwUx4Kkn@vger.kernel.org, AJvYcCUjXVWoZn/kXiNrIusDA5P2Kn8vK1xz+xIZhBxam7JV3QidI0412THcVCvgY0ElBKjMLywACfsLY2BaoyLZMrKQMMA=@vger.kernel.org, AJvYcCXCKJKJDGp7uL9qT738/oyiipeCPoWE4VmWMH/btyNPmgp4wap9zJW7PC71OMGuY31ycDqqcc0S1m8w@vger.kernel.org, AJvYcCXj6M/vYp5ftWSkG5apRbmXAlgg0/+WlHXwgVahB0xl2dsVmHUwPFkSrKt/aiMQh4N3M7frvvpcUILViAIo@vger.kernel.org, AJvYcCXkD9eesBtvKl9rBxhgp5/S/vNPw8iBxNmcI1T6RpSeSOMDn4qYtaaIOgbBYSVlVe34DChq4Ei/gTMJ@vger.kernel.org
X-Received: by 2002:a05:620a:708a:b0:7d4:4214:2cba with SMTP id
 af79cd13be357-7d44214358dmr71619285a.40.1750941117802; Thu, 26 Jun 2025
 05:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com> <20250623080405.355083-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250623080405.355083-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:31:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2EGutZTPPNMdC5LTaVAQzpcVADBy9KMTSgYQHMxQ7-Q@mail.gmail.com>
X-Gm-Features: Ac12FXznJsGPV2UOxrW_ydw441QmYNHWnstaX0n4g87XOD9sgfoD3vhkXgwlTyc
Message-ID: <CAMuHMdX2EGutZTPPNMdC5LTaVAQzpcVADBy9KMTSgYQHMxQ7-Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r9a09g047: Add GBETH nodes
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 10:04, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add GBETH nodes to RZ/G3E (R9A09G047) SoC DTSI.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> v3:
> Labels mdio nodes

Thanks, will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

