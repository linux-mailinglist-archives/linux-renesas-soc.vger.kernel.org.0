Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1E0773D0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Aug 2023 18:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbjHHQNW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Aug 2023 12:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjHHQMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 12:12:09 -0400
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A14C67DB2;
        Tue,  8 Aug 2023 08:46:57 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.30.67.143])
        by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RKs9h38Tpz4f3tNb;
        Tue,  8 Aug 2023 19:56:56 +0800 (CST)
Received: from [10.67.110.72] (unknown [10.67.110.72])
        by APP4 (Coremail) with SMTP id gCh0CgCXc6aGLdJkOOXmAA--.27824S2;
        Tue, 08 Aug 2023 19:56:55 +0800 (CST)
Message-ID: <9d309cd3-7c73-65fd-7e0b-d0491f1c2d67@huaweicloud.com>
Date:   Tue, 8 Aug 2023 19:56:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH -next] net: pcs: Add missing put_device call in
 miic_create
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     clement.leger@bootlin.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, f.fainelli@gmail.com,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        xiangyang3@huawei.com
References: <20230807134714.2048214-1-xiangyang@huaweicloud.com>
 <20230808105456.3vbw3ijqube2yetn@skbuf>
From:   Xiang Yang <xiangyang@huaweicloud.com>
In-Reply-To: <20230808105456.3vbw3ijqube2yetn@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCXc6aGLdJkOOXmAA--.27824S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1UCr1DXFykGF1kXryfCrg_yoWxtFcE9r
        W0vrs3ArWrJF18GFyrAFy3Zr4Y9a4DtFWj9r47JF4rJFnaqFZ7GFs3G3yFy343Aa1kKF9r
        KrW5Ar4q9w1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
        Y4v20xvaj40_JrC_JFWl1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
        A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
        67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
        0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
        x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
        0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
        07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU1zuWJUUUUU==
X-CM-SenderInfo: x0ld0wp1dqwq5kxd4v5lfo033gof0z/
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



在 2023/8/8 18:54, Vladimir Oltean 写道:
> On Mon, Aug 07, 2023 at 01:47:14PM +0000, Xiang Yang wrote:
>> From: Xiang Yang <xiangyang3@huawei.com>
>>
>> The reference of pdev->dev is taken by of_find_device_by_node, so
>> it should be released when error out.
>>
>> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
>> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
>> ---
> 
> Also, the patch subject prefix needs to be "[PATCH net]" (indicative of
> the fact that you want it to go to https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git)
> and not "[PATCH -next]".
Thanks, I will change the patch subject prefix and resend the patch of
v2 with your advice.

