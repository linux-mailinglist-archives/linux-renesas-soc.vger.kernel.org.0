Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAA93441B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 13:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhCVMfR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 08:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhCVMd6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 08:33:58 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22DEC0613DC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:33:30 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z1so19132216edb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bFXSCk7jXzi1oDqUKnupFbkdc1ED5SojZj7S5YlWylo=;
        b=Nb6vq2/ii4Uu5XEatx9s0w0vyMHBFNdJ9XkyhRXQRTYCa2DlOgNpuMLBtGI32mU4LR
         mM7dCOyOsSQiBYx78D9Tou6WPJCLVJK2++P19JKJpLnY6jpQoN++z2bIdKzEKPwiTfB8
         flKUIx/jPAbEh+WGHPcfHxffQaeLfuKX6yZiKFKqfDTbAz9SFCQqpEeOUdO2QyBtYKaB
         Oaywbong+u/EvIZ1Ewmyy2wctKFSPqSSpRnb2lmoQ1pHGjZFL4kuL558WSZeqj9KAhZv
         uvC/l92Hw9hGqb+CsWq5oYBUh8+QoyxagBJkBo5OWb8T+4+67ScVqWdqIvHbdZ1sM5Rt
         FeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bFXSCk7jXzi1oDqUKnupFbkdc1ED5SojZj7S5YlWylo=;
        b=N0Dq4fsR0gFe8PuZwroo5Q2Ma6CBktBt++JTCwbeZGucbkFAHoeNyDrU0bx6o5AWu2
         14MdmBzk/6MV18LnwHIJiVmrjlVAZhnDCI1zSWdJLXKthsbnl4Cv0BWubc51QQkJm4op
         NvV8vEvSkxEMU7qHat9PMRwyuV5laNMBzGZQb/YPqFkjrbs9qBvnTstOaIIgKjFYHBQm
         ZU41TtxRyTIJVCOgldSW+p4QRZbH+KXwwAyhq98ECcduzDi40BvtVu+oSTFRzQkk70tQ
         X9JIROICqoaWfY6CUTGgrh3Nx6aHaYs5heKvaPgBESAk8IDi7fXqd6qm1lfO9dEViP6E
         apAw==
X-Gm-Message-State: AOAM531htqkWh461Q2RTD6QcM5CEOGMPVURbxOadcDgjTRfjAUgXzHCp
        NLHsLcfRMA9cVhmafk67Ec3fITO6fgGAmM1M
X-Google-Smtp-Source: ABdhPJxjAmo2ovKlm60IvoJxky+iKUF6BuDJdKXWp1pzrvgmxzgCNEarFOfUlp+DzNDRON+cPs/jug==
X-Received: by 2002:a50:fc94:: with SMTP id f20mr25432235edq.370.1616416409440;
        Mon, 22 Mar 2021 05:33:29 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
        by smtp.gmail.com with ESMTPSA id q10sm11247181eds.67.2021.03.22.05.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 05:33:29 -0700 (PDT)
Subject: Re: [PATCH 03/13] PCI: xilinx: Convert to MSI domains
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-4-maz@kernel.org>
 <20210322122315.GB11469@e121166-lin.cambridge.arm.com>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <a9fee2d4-5810-7a16-78bc-4b192e1123dc@monstr.eu>
Date:   Mon, 22 Mar 2021 13:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322122315.GB11469@e121166-lin.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 3/22/21 1:23 PM, Lorenzo Pieralisi wrote:
> On Thu, Feb 25, 2021 at 03:10:13PM +0000, Marc Zyngier wrote:
>> In anticipation of the removal of the msi_controller structure, convert
>> the ancient xilinx host controller driver to MSI domains.
>>
>> We end-up with the usual two domain structure, the top one being a
>> generic PCI/MSI domain, the bottom one being xilinx-specific and handling
>> the actual HW interrupt allocation.
>>
>> This allows us to fix some of the most appaling MSI programming, where
>> the message programmed in the device is the virtual IRQ number instead
>> of the allocated vector number. The allocator is also made safe with
>> a mutex. This should allow support for MultiMSI, but I decided not to
>> even try, since I cannot test it.
>>
>> Also take the opportunity to get rid of the cargo-culted memory allocation
>> for the MSI capture address. *ANY* sufficiently aligned address should
>> be good enough, so use the physical address of the xilinx_pcie_host
>> structure instead.
> 
> I'd agree with Bjorn that the MSI doorbell change is better split into
> a separate patch, I can do it myself at merge if you agree.

Thank you for doing it.

Thanks,
Michal
