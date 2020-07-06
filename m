Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1600215B34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 17:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgGFPvU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 11:51:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:37695 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729321AbgGFPvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:51:20 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N3Xvv-1krLoC0Jdb-010cOU for <linux-renesas-soc@vger.kernel.org>; Mon, 06
 Jul 2020 17:51:19 +0200
Received: by mail-qk1-f169.google.com with SMTP id c139so35167772qkg.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 08:51:18 -0700 (PDT)
X-Gm-Message-State: AOAM532vv16C2St67X1rIwn/GjpWRoOkDJvUW+0cT5rkCxgHh+SM8JUN
        0anB6BpDkqqIYRY+L+EzvaAJiWrbp7fmeul+BN4=
X-Google-Smtp-Source: ABdhPJzY2TcHbpOfmdqcLAi/aZ0HkS9a5BiH/WrsRt6IoMygszVGPkf17CVynVLE2AHIW5Ro9onjfPGdVUeI3JZzTxM=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr40769007qko.138.1594050678021;
 Mon, 06 Jul 2020 08:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200703120642.5128-1-geert+renesas@glider.be>
In-Reply-To: <20200703120642.5128-1-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Jul 2020 17:51:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nHKP2uvCh1EEH1C0xb0-Az7+_0mgKP+4SQ89n_U4BHQ@mail.gmail.com>
Message-ID: <CAK8P3a3nHKP2uvCh1EEH1C0xb0-Az7+_0mgKP+4SQ89n_U4BHQ@mail.gmail.com>
Subject: Re: [GIT PULL 0/2] Renesas ARM SoC updates for v5.9
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yJxJf0kzJVpKgfUwBClk3vplm41ga7Mg9D3nvX5lVCTyUIolh5e
 O+JWM6Oa4O3CyxsVOVimfKBWOfM6re3ZedcdCsVmeZlasmoQ5vIHkySWgui41GHH2jVRoGW
 w0d8inz/285cmFXu16kWTYo9HJmX/2BKMvzQJB3zohxCrQin+cqe9CctUk+OyN3tKhPnauZ
 eHMKXibF+qpyrDGxQuSxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aUUwYleh78M=:dZw7sFLoQBt3OjFxzFG95P
 nltXbV7bXMPu1UHrWDPwWErclog5UjZf3DesBIc0aYWAS3BkCO2AKHx3wbE/pRgn086hCj1JZ
 Mz6O8JWFkMa9O3PEgQtwwyaBap+1cg/qJRZcUkij1xZvxC19Xd9BHkrc6ZS88dcqDsxFkJqL1
 pHyi6vp5R3z209F2mFFA7lj39pCpWyDl4PVUmYqS0aBXyrfCZy2rFht8WimNSVM2hYl9LSNMD
 nWfHxR+zW5XSdIsPOKh2/Sfete9dK06o4k0D/7bvX/BoytZsf8MXGcABdznwBLS+f0bhEL13j
 g2Z4EWgHTrEeQqn0g8Eo0MBqA1ILG4YpXo36rgODt0oaGZGAviI/iUvuqwSRkCRij6ToLeOQC
 DNOWwhdmwPXiHMFH5eL2TrsJA8jbZGY/F2E69C3UHMWSWKn99B6Qn6stF09VWtBoRSO31WYJk
 ioiC25kUAgy4phpgH1/ZtytfkDzt0JeFMRCkMKMlmIwaa+7CZLs2J4fi0kSlmEEmaDGdgCxDo
 jumFXA7bAQyJH17kSPEgwhSoN2n4L9AqJxUhYAStGuMEXr/lTyzGBrYASKTy8M9mQzF6mXoZr
 XcV5ONonxuqsFvSf5avqziiJJPOrIko5YVCQZYD8gDRB46houBsMeoWJSLZXaKu0F5ANjmsuV
 K4IU7NEhqnyUwodbQ8QolcxZyLyCdXVTT2pB6Cs5pCH2IoxwqRCx58goGFljDmK8NYs54ImFv
 8MrkY61RWFYIqIsuN+NL2Vr0SJ088F/rGm7KhG2KjYM9E4nKzxCSVcZ8UmfqWt6ntFbEtP10l
 R0tcuAcfMHFHAV3KFAHEs6i+8BOM9V66Rzo1FRiUB9h2/BxULAYDyikdoSXiyRa+6wi4dFpok
 PM5ylaQA4MwVq/gLBZ7zueB2sBT8nqQ0p1QnUOh81ijWftvRROYxEAptW8GuL1j3jWPOS7Ph1
 8kHCJkJMTl3pCNyBEf2mk61hON/tGNsXW+ofc1Dg4U06++3o95FV0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 3, 2020 at 2:06 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi arm-soc folks,
>
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.9.
>

Pulled both into the soc tree, thanks

     Arnd
