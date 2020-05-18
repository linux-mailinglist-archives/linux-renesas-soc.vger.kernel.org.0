Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CFB1D732B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 10:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgERIpC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 04:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgERIpC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 04:45:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA693C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2020 01:45:00 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a4so7280711lfh.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2020 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iNhAxT8nBFkFqd8+dMCg1JOOShaimOk34qzF5PJdQdY=;
        b=emu5NFwNErB+ukhcZNPkHG/hTCKflNe5tJo1yiEuUvRQPxZbox7WP45+dR939SeC5D
         ir5tlCuYxvl0kAYYgnnlmBS4hc/lojWJuOJy7rdWYHnyJmRev3ZeDZm5F0Sj04rgL52l
         9eVmDleJTualizPi+F1bEnlG3ycKP85sx3nHlAMhBKC/IXDssPM5L2LHMKz4bo1Ac8Qg
         CRfHqz5CLd3ftaLkRwdNsByuqM7fYpa5wm+z5k3mDnuMKm8CA2BHs/XNwB2UUxDOcPUW
         h+yK0GfbvdYexhNwbwDXnh4vZSiS6Ueeoe5EmrozCnj0FcPkszckaQVYsVLnv0MBicTW
         70Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iNhAxT8nBFkFqd8+dMCg1JOOShaimOk34qzF5PJdQdY=;
        b=cnRYxDpXsSOiz0i5xOZYaCYa0ZCn382PWyh6ZMwpMfkbyR2JJdmUuKFlxnjD2AM4BR
         nznZ/pYydHPTRLAIX/Iq7YY4yE+isYhA+qSd8Q3FmosITIra7Y2vGLrSNnUO01FC2hAl
         fJ9hjgTsVeLAYjsAzLRM7U5mY8OX0GcuilK4zIGdo+Kc02jSC65ZO/IFwkdFVVKSmk5Q
         thPawzdDHtL9MvWdpRdtlh7+RIOzEKSxJs9yHL0vMG5nPCVrGsMZ1ax5QZG3vjmiXmS0
         Xg0hFBRaIxCRHYupX1rBma4KW54bNYVgQ+KfVgQu53TZAVFBIsARAARAItAKTPihYeP+
         ghCQ==
X-Gm-Message-State: AOAM532gPGYz7lfRv1IJ4GzMGNif75kHTFEq1KlMPpWRr9081Sq2fl/n
        MDekzll4PtIY+kIXtKAojoT1w9Y0JfKp6g==
X-Google-Smtp-Source: ABdhPJwuWOU5prQ9bA8hm6t2EYExpOlgB2/AvLyxAZwXE01lzdpQhVDTrCYjTZtG2hd4FVZqt27+zQ==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr10849272lfi.47.1589791499083;
        Mon, 18 May 2020 01:44:59 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:46bf:e420:f94f:d60b:efec:4413? ([2a00:1fa0:46bf:e420:f94f:d60b:efec:4413])
        by smtp.gmail.com with ESMTPSA id s4sm5390012lja.14.2020.05.18.01.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 01:44:58 -0700 (PDT)
Subject: Re: [PATCH v2] ravb: On timeout disable IRQs to stop processing
To:     Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Shashikant.Suguni@in.bosch.com
References: <20200518045452.2390-1-dirk.behme@de.bosch.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <41c79682-c707-d393-57d8-954586f81ab3@cogentembedded.com>
Date:   Mon, 18 May 2020 11:44:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518045452.2390-1-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18.05.2020 7:54, Dirk Behme wrote:

> Analyzing [1] it seems there is a race condition where ravb_start_xmit()
 > can be called from interrupt while tx skbuffs are being torn down in
 > the scheduled timeout handling. The actual timeout work is done in
 > ravb_tx_timeout_work() during which the tx skbuffs are torn down via
 > invocations of ravb_ring_free(). But there seems to be no flag to tell
 > the driver it is shutting down so it continues to use the ring buffer
 > when it should not.
 >
 > Fix this by disabling the interrupts in the timeout handler.

    Hm, given that we stop all TX queues prior to tearing down the buffers,
it is somewhat strange that you see the driver's send path called...
    But disabling the interrupts seems the Right Thing anyways...

> [1]
> 
> -- cut --
> ravb e6800000.ethernet ethernet: transmit timed out, status 00000000, resetting...
> ravb e6800000.ethernet ethernet: failed to switch device to config mode
> Unable to handle kernel NULL pointer dereference at virtual address 00000018
> Mem abort info:
>    Exception class = DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
> Data abort info:
>    ISV = 0, ISS = 0x00000046
>    CM = 0, WnR = 1
> user pgtable: 4k pages, 48-bit VAs, pgd = ffff80065622f000
> [0000000000000018] *pgd=00000006962a7003
> , *pud=00000006962a8003
> , *pmd=0000000000000000
> Internal error: Oops: 96000046 [#1] PREEMPT SMP
> Modules linked in:
> ...
> Process Thread1 (pid: 3132, stack limit = 0xffff000027dd0000)
> CPU: 2 PID: 3132 Comm: Thread1 Tainted: G        WC 4.14.130-ltsi-g28acae87 #1
> Hardware name: Board based on r8a7796 (DT)
> task: ffff80064f2aaa00 task.stack: ffff000027dd0000
> PC is at ravb_start_xmit+0x138/0x5a0
> LR is at ravb_start_xmit+0x40/0x5a0
> pc : [<ffff0000084d6324>] lr : [<ffff0000084d622c>] pstate: 600001c5
> sp : ffff000027dd3550
> x29: ffff000027dd3550
> x28: 0000000000000076
> x27: ffff80061035ff00
> x26: ffff000027dd3694
> x25: ffff80069624f800
> x24: ffff80069624f000
> x23: 0000000000000003
> x22: 0000000000000001
> x21: ffff80069624f000
> x20: 0000000000000000
> x19: ffff80069624f000
> x18: 0000000000000014
> x17: 0000ffff9b90ddb0
> x16: ffff00000867d07c
> x15: 0000155107b31031
> x14: 000409000c000000
> x13: 0000000003000001
> x12: 0100050010000001
> x11: 0000000003000001
> x10: 0100010010000001
> x9 : 20000000000000c0
> x8 : 0000000000000000
> x7 : ffff8006656f9388
> x6 : 0000000000000002
> x5 : 0000000000000000
> x4 : ffff8006656f929c
> x3 : ffff000027dd3694
> x2 : 0000000000000018
> x1 : 0000000000000000
> x0 : 0000000000000003
> Call trace:
> Exception stack(0xffff000027dd3410 to 0xffff000027dd3550)
> 3400:                                   0000000000000003 0000000000000000
> 3420: 0000000000000018 ffff000027dd3694 ffff8006656f929c 0000000000000000
> 3440: 0000000000000002 ffff8006656f9388 0000000000000000 20000000000000c0
> 3460: 0100010010000001 0000000003000001 0100050010000001 0000000003000001
> 3480: 000409000c000000 0000155107b31031 ffff00000867d07c 0000ffff9b90ddb0
> 34a0: 0000000000000014 ffff80069624f000 0000000000000000 ffff80069624f000
> 34c0: 0000000000000001 0000000000000003 ffff80069624f000 ffff80069624f800
> 34e0: ffff000027dd3694 ffff80061035ff00 0000000000000076 ffff000027dd3550
> 3500: ffff0000084d622c ffff000027dd3550 ffff0000084d6324 00000000600001c5
> 3520: ffff00000921d008 ffff8006159b0d00 0000ffffffffffff ffff0000084d622c
> 3540: ffff000027dd3550 ffff0000084d6324
> [<ffff0000084d6324>] ravb_start_xmit+0x138/0x5a0
> [<ffff000008699d60>] dev_hard_start_xmit+0xa8/0x24c
> [<ffff0000086c51c0>] sch_direct_xmit+0xb0/0x1a8
> [<ffff0000086c54cc>] __qdisc_run+0x214/0x2ec
> [<ffff00000869a348>] __dev_queue_xmit+0x35c/0x5b4
> [<ffff00000869a5b0>] dev_queue_xmit+0x10/0x18
> [<ffff000000b9765c>] register_vlan_dev+0xc74/0x10f8 [8021q]
> [<ffff000008699d60>] dev_hard_start_xmit+0xa8/0x24c
> [<ffff00000869a438>] __dev_queue_xmit+0x44c/0x5b4
> [<ffff00000869a5b0>] dev_queue_xmit+0x10/0x18
> [<ffff0000086a5b9c>] neigh_connected_output+0xc0/0xe4
> [<ffff0000086d6bd8>] ip_finish_output2+0x3c0/0x3fc
> [<ffff0000086d8178>] ip_finish_output+0xf8/0x1c4
> [<ffff0000086d8b74>] ip_mc_output+0x258/0x308
> [<ffff0000086d8400>] ip_local_out+0x44/0x54
> [<ffff0000086d9594>] ip_send_skb+0x1c/0xa8
> [<ffff0000086fea4c>] udp_send_skb+0x11c/0x244
> [<ffff000008701084>] udp_sendmsg+0x534/0x6bc
> [<ffff00000870b390>] inet_sendmsg+0x40/0xe0
> [<ffff00000867b588>] sock_sendmsg+0x3c/0x58
> [<ffff00000867bf18>] ___sys_sendmsg+0x228/0x278
> [<ffff00000867d03c>] __sys_sendmsg+0x58/0x98
> [<ffff00000867d08c>] SyS_sendmsg+0x10/0x20
> Exception stack(0xffff000027dd3ec0 to 0xffff000027dd4000)
> 3ec0: 0000000000000012 0000ffff8a7fdf18 0000000000004000 0000000000000000
> 3ee0: 0000ffff8a7ff258 0000ffff8a7ff150 0000ffff8a7ff840 0000000000000000
> 3f00: 00000000000000d3 0100010010000001 0000000003000001 0100050010000001
> 3f20: 0000000003000001 000409000c000000 0000000000000047 0000155107b31031
> 3f40: 0000ffff9b67dfb8 0000ffff9b90ddb0 0000000000000014 0000000000004000
> 3f60: 0000000000000012 0000ffff8a7fdf18 0000ffff780017b0 0000000000004000
> 3f80: 0000000000000010 0000000000000001 0000ffff8a7fdf00 0000ffff9000b770
> 3fa0: 0000000000000012 0000ffff8a7fde60 0000ffff9b90de10 0000ffff8a7fde60
> 3fc0: 0000ffff9b90de28 0000000080000000 0000000000000012 00000000000000d3
> 3fe0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [<ffff0000080832c0>] el0_svc_naked+0x34/0x38
> Code: d37d7c01 d37d7c02 f90037a1 f9445f01 (f822683b)
> ---[ end trace eabda93d178d5bcb ]---
> Kernel panic - not syncing: Fatal exception in interrupt
> SMP: stopping secondary CPUs
> Kernel Offset: disabled
> CPU features: 0x1802004
> Memory Limit: 6144 MB
> -- cut --
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> 
> Changes in v2: Dropped the RFC and added Sergei's Reviewed-by. No functional
>                 change.
> 
>   drivers/net/ethernet/renesas/ravb_main.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 067ad25553b9..0f91ab41b22b 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1447,6 +1447,11 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>   
>   	netif_tx_stop_all_queues(ndev);
>   
> +	/* Disable interrupts by clearing the interrupt masks. */
> +	ravb_write(ndev, 0, RIC0);
> +	ravb_write(ndev, 0, RIC2);
> +	ravb_write(ndev, 0, TIC);
> +
>   	/* Stop PTP Clock driver */
>   	if (priv->chip_id == RCAR_GEN2)
>   		ravb_ptp_stop(ndev);

MBR, Sergei
