Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3082023C957
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 11:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgHEJiV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 05:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728410AbgHEJfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 05:35:48 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE223C061756;
        Wed,  5 Aug 2020 02:35:47 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w25so11445341ljo.12;
        Wed, 05 Aug 2020 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YcKxbvCRXyurlTNSsqQIUOw8ECofP9xut68p0yIsm20=;
        b=vGEFNonNCjkqyA5G5aJZffvy1oM/gEyH5/KnKwN6vc5k/ccvQC62+ESHJhItDLSWzZ
         jXsmvgfsWFNXpnbap4IMtzBZcorC128HeVicOOL73Z054PJiBq4F5b/DGnlRHza9SeyO
         xW/9/vde9zsEDdYZuwY1+M1B4JuFxVzN4384uvFT3uhmWMAvytL4w2f+K3F+YycBz52c
         6Ip4MpsWmhB1PT20FSZIofPm12/8+caxSjr1w9IMwz5lzodB0X5RmVMNhgq+iIceK/Gj
         K+udx+uCryUxO0gq/YCyRSvNlmIPh8wIj8sNnE597iaWWb421PRjqziu4ARdSsnv5dqs
         I/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YcKxbvCRXyurlTNSsqQIUOw8ECofP9xut68p0yIsm20=;
        b=m2UZyWv6jP/c8Xjt20BNBuQtIyhrV+9Y+NGsyIBDR/i4wYiz5ADtEG9IFzCiG9O87b
         4m8hEGAJro5Cm7YUVpHGY7UHCxsDfJD9L8v/HXFlVDXcSYlyPIcapU30O4mvDkfnmjGr
         ZoKsdsd+5KhtnMQODx2E0xdLTn+Wh3eVPLoqzum59Vlxh2kL5sgHbNr8+8b8pTaDsNX8
         DcytqyBJLaTMcWou1P22gW4mV9DqIZSK+bu8Y8TdhfOMY1WqWfGdeWYJOEzf1kuO5Mri
         Gd30ZC0XMwdszXTgCeG366PdTI0qK7xlT39X7fDhckFivk1HPjO7YjgfWxr4Q3MN3eLR
         3vYQ==
X-Gm-Message-State: AOAM532JIiBA5fzKq6vb4/BbiWV5nceyU+MufGRpLKGwzZIrYQjqX7yE
        eOMf2bI58+1Cd1+2p9T/+Fplr5haGjo=
X-Google-Smtp-Source: ABdhPJykz9lNyNqAIQZiR+REsQuE7VR1JUqi9NO+hLo2QWxzgA7/KLsWz4puYkpwicIevwoLYRVH8g==
X-Received: by 2002:a05:651c:310:: with SMTP id a16mr958386ljp.250.1596620146210;
        Wed, 05 Aug 2020 02:35:46 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:464a:40dd:24ec:bffd:e539:8806? ([2a00:1fa0:464a:40dd:24ec:bffd:e539:8806])
        by smtp.gmail.com with ESMTPSA id t18sm845757lfb.69.2020.08.05.02.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 02:35:45 -0700 (PDT)
Subject: Re: [PATCH 3/5] usb: typec: hd3ss3220: Use OF graph API to get the
 connector fwnode
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
 <20200804174828.8339-4-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <e401f3de-629c-f1e5-cd3f-9c870fe3b2c0@gmail.com>
Date:   Wed, 5 Aug 2020 12:35:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804174828.8339-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 04.08.2020 20:48, Biju Das wrote:

> Some platforms have only super speed data bus connected to this device
> and high speed data bus directly connected to the SoC. In such platforms
> modelling connector as a child of this device is making it non complaint

    Compliant? Complaint is when you complain. :-)

> with usb connector bindings. By modelling connector node as standalone
> device node along with this device and the SoC data bus will make it
> complaint with usb connector bindings.

    Ditto.

> Update the driver to handle this model by using OF graph API to get the
> connector fwnode and usb role switch class API to get role switch handle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Ref:https://patchwork.kernel.org/patch/11669423/
[...]

MBR, Sergei
