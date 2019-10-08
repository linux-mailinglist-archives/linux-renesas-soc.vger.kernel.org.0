Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8D00CFE9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 18:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfJHQNd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 12:13:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38860 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfJHQNc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 12:13:32 -0400
Received: by mail-lj1-f195.google.com with SMTP id b20so18194074ljj.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Oct 2019 09:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j7gjx5G7Uz/FbkLOVtZemWXw8Fp3YEGXhMTNEIXEOQs=;
        b=Nt6u0R3aTXoQUqetNz1K+Fz0AajxMgWUP3bL+LzaD/T7D0bBOmph5jTL1sBvwH0MBH
         9NCvqBPX3TIgpZzAL+1iSClGYJ0q9okAZrRXxdxpyDtooIDM4OfNFNBCu+Bn6THiAmy7
         Y9WMd4tmymvRulvXqr+gyHt9g0pt1qX3iD+6VraBwdoNL71mXU8vN5fvbxKP3ldUtEVh
         gI9lWJxXl4neONNeA+CZVSAMppfVuOzgOZGOkOHS2c9Ielfmw6X6OXRvUgSl7hnQMPrz
         9eMmNvFvc7qHJKUHlPJIQ+jTOvTS7k98Kgyl/Vme79GDjkKSlXTYl5jS24dBjJxN/M0D
         aIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=j7gjx5G7Uz/FbkLOVtZemWXw8Fp3YEGXhMTNEIXEOQs=;
        b=hFZi0kG4UpGlSHMUZ/4PLuBY4dMFqW6XWwebw/vUSdUj/1rDKdgTgF7ECdJj/T9vya
         vtJsDuPo9ZZefZ2BGoswpWIbY+LIuL+Qo7UTAc1zuVM5DFqTBjzc3vgWVGmuqzltJdrm
         qa4P1WmBCTuTeG+PR0mDHr5COsLx/sYHUO0IYvl5nutg189C3cnBLamBkp6vtynn7WgS
         jCYg2G83SJmEeVt2j8HVFZYuSNrkZ2DAxXN+rPMVWYyX4hhQjQEJaiFkNnV+6jCeaLDJ
         8j4iYrwHe36fL5fvtokiLMe2MWEPUHN6P4Mf0qyInOGmyTud19XIs/qVB20usg6853VJ
         YHlA==
X-Gm-Message-State: APjAAAWTOxOaO61BYvGDy5ko0dN7cOCJ7f9P+sIxG2gxWAzyectBWS6N
        njPsMVFosc+bWCGx93JXAxWrVP33kjA=
X-Google-Smtp-Source: APXvYqzisb5iFHqt5AyKDsDhNQf3ZTW3WLhp4rt+e2lFxJ1NCIm3R1MaRIZNSm1qKirywzOFoygV5A==
X-Received: by 2002:a2e:780d:: with SMTP id t13mr20238558ljc.251.1570551211111;
        Tue, 08 Oct 2019 09:13:31 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4297:2ce2:b8b8:e7f7:2cc8:e6b0])
        by smtp.gmail.com with ESMTPSA id y13sm4173990ljd.51.2019.10.08.09.13.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 09:13:30 -0700 (PDT)
Subject: Re: [PATCH] PCI: rcar: Fix writing the MACCTLR register value
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        horms@verge.net.au, linux-pci@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
References: <1570529884-20888-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <2ae9793a-2500-496f-2e18-927237fbd02a@cogentembedded.com>
Date:   Tue, 8 Oct 2019 19:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1570529884-20888-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 10/08/2019 01:18 PM, Yoshihiro Shimoda wrote:

> According to the R-Car Gen2/3 manual, the bit 0 of MACCTLR register
> should be written by 0. To avoid unexpected behaviors from this

   s/by/to/. I'd also mention that this bit is set to 1 on reset.

> incorrect setting, this patch fixes it.
> 
> Fixes: b3327f7fae66 ("PCI: rcar: Try increasing PCIe link speed to 5 GT/s at boot")
> Cc: <stable@vger.kernel.org> # v4.9+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
