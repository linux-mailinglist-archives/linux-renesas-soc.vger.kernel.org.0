Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F24F118E95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 18:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727568AbfLJRJl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 12:09:41 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36926 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfLJRJl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 12:09:41 -0500
Received: by mail-lj1-f194.google.com with SMTP id u17so20773111lja.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2019 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=K8JiV5XMl1ac7XRD5k/O7VNVwdh93m34JRZ/SLdtoRs=;
        b=ZX6+qqMxhPUpUTDWrJnuNPHxxz5etn1hLQ1wuYuHaoGAb1gSrHBhPbjk2TX99LxMeG
         9agC5GfNWc4RhmnVU3DAFqYRBoOoWP7bve2KSpH0mS0Bk7WQmvglH+l9E1Gx3eVbLwYZ
         FkILqbcx4HbsBJQ6atLX/RCvk7xnThcheD693wemIlwoYjKEwMcPPE5FQD+SPpWb7hXP
         B3J9xhfJ62yfg6+cRj2gGA39+2LkRV2mR59v/ttAhgtjavJ0FbeLAGCJK/+NKi0T7Wnj
         8YngHG/7TaGTZZLWQ5brkgQKqK/yTKwIDabygCg3Vf1zIUO4bOo2QJq6hpdnZW67pNkl
         o9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=K8JiV5XMl1ac7XRD5k/O7VNVwdh93m34JRZ/SLdtoRs=;
        b=EygRyVqKa32yclQNNUe0RqaMKwd90dd/i1VyADmlklMRoocYOZ4l5Zdn+p55oYgbXM
         mCXcwmSjO4m3H0J+OJRNQGw7lngFYkypr39LwfanQzI3PwQkn6ADoUDohaJKfETEV+I9
         +nDHG9jboYxd3OFa7NS/1eJIjRHf17VXuvcZJGZxSpZgi/91dzWSIFO287+ujK/CaPg0
         /Lg9/bwSuglS53z3mW0AbLdumKbHUleW+kzqSBPwU7yHMEiDP9hAUcxOBQRVxojQzVTd
         C85ngMaazkYS0Lv+vYxJtMxoVaF5y+fkGDiSfppLdHMFcSyVxhtB693k5lKzpuRnufer
         69fg==
X-Gm-Message-State: APjAAAXwtJ7LSto1u29YpJ1qApCHL0SStkBYBpB22tWuhj6K4MGrI9Es
        lVvuILBPykN10bIIkRFOiIsm+Q==
X-Google-Smtp-Source: APXvYqwSNC3AoVowSGKWAMoJO0wCskeX6zxpbF6jEyh/Z2ToHaoH1Qc1J4IoiIVdIrO7JnqeEDq8gg==
X-Received: by 2002:a2e:880c:: with SMTP id x12mr18636490ljh.44.1575997779156;
        Tue, 10 Dec 2019 09:09:39 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id k25sm2099775lji.42.2019.12.10.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 09:09:38 -0800 (PST)
Date:   Tue, 10 Dec 2019 18:09:37 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Restore debugfs support
Message-ID: <20191210170937.GA6956@bigcity.dyn.berto.se>
References: <20191209101327.26571-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191209101327.26571-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-12-09 11:13:27 +0100, Geert Uytterhoeven wrote:
> Since commit 0e4a459f56c32d3e ("tracing: Remove unnecessary DEBUG_FS
> dependency"), CONFIG_DEBUG_FS is no longer auto-enabled.  This breaks
> booting Debian 9, as systemd needs debugfs:
> 
>     [FAILED] Failed to mount /sys/kernel/debug.
>     See 'systemctl status sys-kernel-debug.mount' for details.
>     [DEPEND] Dependency failed for Local File Systems.
>     ...
>     You are in emergGive root password for maintenance
>     (or press Control-D to continue):
> 
> Fix this by enabling CONFIG_DEBUG_FS explicitly.
> 
> See also commit 18977008f44c66bd ("ARM: multi_v7_defconfig: Restore
> debugfs support").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued as a fix for v5.5.
> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index 7f0985e023313b57..64fa849f8bbe0617 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -215,4 +215,5 @@ CONFIG_DMA_CMA=y
>  CONFIG_CMA_SIZE_MBYTES=64
>  CONFIG_PRINTK_TIME=y
>  # CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_DEBUG_FS=y
>  CONFIG_DEBUG_KERNEL=y
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
