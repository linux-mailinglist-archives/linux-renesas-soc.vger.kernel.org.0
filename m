Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02991A31E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 11:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgDIJgS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 05:36:18 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42340 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDIJgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 05:36:18 -0400
Received: by mail-lf1-f67.google.com with SMTP id s13so7394515lfb.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Apr 2020 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F1hqxHeKu6Sn0qcjBqnpzejmFgF8FiXlYOaHHEiN1U4=;
        b=r9cnIsxGH9g45TL7ekMdcxZMpShKraueO64GLT6yyMthC56S+z0hvUACligVUNToNY
         jEkYid9BTnN3B5HO4QP/VfE5DGdN0bxdrR8s4OCUvRGYmBeB2Vt7DVMO+L2S4fQs9Mlo
         /bT01v49+1apQOFowKkkbv16nQ/dExTSSHDWSJrSHVo9rPhcVwwBhycU/O84PHNyGiwb
         XChLTMm/zk9pii0YUfIMKe32XG+WA01ZozvSayP2PsvF26YcunRcCwIgRgrrVvC85tBU
         C9PfSfl5ITUvE9euSaNitly9N5M+/zfDLpQsFiaF7BQ9GM7k2/a0kwluucySEMF+2lIe
         JwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F1hqxHeKu6Sn0qcjBqnpzejmFgF8FiXlYOaHHEiN1U4=;
        b=Jzb19iwh6kV9t56lPytJmgdqRg+XyqNpN99Sx3qYRkxYEgRlX8/aYOKi5tFL32xzuG
         gMS+WVK54jywsoTw2Pj3yatWyA6sOZUmf8lEZtQlOYCTCqzsCkG+D3YaaB8EBTWZTNRj
         xNgRMZfSw0SFuNzKr4vCrYeWybmUYx1CzBvl1tq2eVMENeFVKuuMKfP8z300kQfRsXkE
         nUbDYBVQHk1/02KaXSZK8wDTY+2rJDFR7PLw404yMy5xluixawund3D/mVq2r2kRevDv
         +ctlfj5qAPotpTSX+AvXlesXZpP4MKgjIcP4yo3rzQ/q0wo1IAQujneoJUTZYBwj5FSs
         3lWg==
X-Gm-Message-State: AGi0PuaBZGJkUT/qI9779p2W30viZONMuxD5aR1NrU294u5K6/WUbuTG
        mSOEN77TohPw4kvAgi/s8e1hqg==
X-Google-Smtp-Source: APiQypK/OqsgUggpyVaKp/qQ7mjyDy1mfGomhSAWpX/eUf3QmYwoKQnIdpStF6Miir15JkNuk554jA==
X-Received: by 2002:a05:6512:54e:: with SMTP id h14mr7301299lfl.56.1586424975925;
        Thu, 09 Apr 2020 02:36:15 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11? ([2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11])
        by smtp.gmail.com with ESMTPSA id 125sm14965138lfb.89.2020.04.09.02.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:36:15 -0700 (PDT)
Subject: Re: [PATCH v7 7/8] PCI: Add Renesas R8A774C0 device ID
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Tom Joseph <tjoseph@cadence.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-rockchip@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
References: <1586360280-10956-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586360280-10956-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e3f5fa77-f78e-edbf-9efc-53b5ea620460@cogentembedded.com>
Date:   Thu, 9 Apr 2020 12:36:06 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1586360280-10956-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 08.04.2020 18:37, Lad Prabhakar wrote:

> Add R8A774C0 device ID so that this can be used by
> pci_endpoint_test driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   include/linux/pci_ids.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 1dfc4e1dcb94..9e957c18abeb 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2460,6 +2460,7 @@
>   #define PCI_DEVICE_ID_RENESAS_SH7763	0x0004
>   #define PCI_DEVICE_ID_RENESAS_SH7785	0x0007
>   #define PCI_DEVICE_ID_RENESAS_SH7786	0x0010
> +#define PCI_DEVICE_ID_RENESAS_R8A774C0	0x002d

    We don't add the device IDs in this file, unless used in several places.
Is it?

[...]

MBR, Sergei
