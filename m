Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113BC1E5C2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 11:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgE1Jge (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 05:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbgE1Jge (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 05:36:34 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1E6C08C5C4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2020 02:36:33 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q2so32505052ljm.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2020 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cGBjK9dCqo4dJlRsAbsmYEmaf4ENvwE2PZqmvJJX8M4=;
        b=1CdnlxqyvBU7dZGaclXOqtXkchUtcx8j+YdkbFP1SpxOQD5+Z0QjNkcog7a7zJAM+X
         6F29RiX4ZfqJqyZ7ODDujaG2SZXMgdQOnoflxf3LY0JLitj8xzT9BrIEyY8ErizM+fnQ
         Vv5WFtvy/m/JBBS53FZaYgyxdFH8d3wLyOKB3wLIxvsZhkuteura0/Gkr5KP1bUMMQCT
         gIfvBvs7cw8YtHFb13TS3sWxZO1S3aDSuNe+xTAqdhT5QM2CX8IsIS1khWRe6zCm+Hss
         IEZx3K4VTofvQYeehMCaAd8Zl4lPgwvV0jYFHwJ0UqxZrqln4l59TSyBp7S7BTBp4rMw
         MGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cGBjK9dCqo4dJlRsAbsmYEmaf4ENvwE2PZqmvJJX8M4=;
        b=SCzQmj5x9N65nx5EbGnHRd3/OXUClqSD0592ZyTgCNJvFGluyZel334ANpJl1Rial5
         BLhNmQiZlFy8prsqm6lSSwlFjIBalsaKYs3oiLlgMqNJRHfco/gmyRkMGsJRu0KRFw6q
         VQipQP+gdjTAB9lXxxQ6zGTMUw4dRGic5E0ghQjBYw3N69pebsC3oZWqkWV64ddFPKcI
         +IBCoAxCs9uSeCUZqh1z/KeKrbg9as9IiYa8XCpJo7DMzFAapsW7yAFajCs7+YS/p+s0
         cPLJ2Tw3WonN+aS2nDM+vI35m4aQIs9w02JyRUfY1yrGBV9iMofCxhNJhehtP6yidw67
         JVuA==
X-Gm-Message-State: AOAM531r2BfjDbKRaBStgIkAbJhc7eDVb/8E8r4ujuAHo31QP2K3Nk7C
        2vHA39VaZ6+e8bPfpFnr2nZZpA==
X-Google-Smtp-Source: ABdhPJxLh5yqRSdwkZzVilW71YX+8M+avD1C0OgSooGK0fXIccgCzTlLZmQDYcG+oevjO0jEnJ1Ecw==
X-Received: by 2002:a2e:a171:: with SMTP id u17mr1102613ljl.225.1590658592283;
        Thu, 28 May 2020 02:36:32 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:49a:1ab0:1dad:577d:c46b:c479? ([2a00:1fa0:49a:1ab0:1dad:577d:c46b:c479])
        by smtp.gmail.com with ESMTPSA id s2sm1335424ljs.39.2020.05.28.02.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 02:36:31 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0 and
 XHCI
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <1590611013-26029-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590611013-26029-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ecd8d191-6e52-ebae-facb-c4a211dcb1ef@cogentembedded.com>
Date:   Thu, 28 May 2020 12:36:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1590611013-26029-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 27.05.2020 23:23, Lad Prabhakar wrote:

> Enable support for HSUB, USB2.0 and xhci on iWave RZ/G1H carrier board.

    HSUSB, xHCI.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
[...]

MBR, Sergei
