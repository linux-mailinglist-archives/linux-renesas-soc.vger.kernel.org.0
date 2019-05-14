Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 685891CFEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 21:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfENTaT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 15:30:19 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36230 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfENTaT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 15:30:19 -0400
Received: by mail-ot1-f65.google.com with SMTP id c3so16361790otr.3;
        Tue, 14 May 2019 12:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HIMR+DIH6rdR6Yw4tErlWybT9HlSjqfGRbrJTH3k/h4=;
        b=opSVGUh1B9RSpMBIcejkW4Rv47rIBS1RCUQcd91T4yAIbtndH0sp6+OhIXpLaU/pM0
         6kx+ZmnEQEmQZjnvRwGyWQa7sbH4Aj/WPDRhe0Uias7XVaZUYBxiUMJ/m+2rRrZA/TXx
         y2yn/AuYpD1Bqyw8ThqHenxtpCXpemiHgBHEKihhZyWP0mhqCQ9DLQ0ziZsG6EoOxqCo
         PnnzHZXfuS+0sAeHLh8b/zSr8KjYXtMuOhG488DE+Xh1S7DFRPehuRKIqyZiV3r0yxwW
         2/RTAgKhrbfY2AFdzUFci0CFjqfDw950lj6VKIJTJznO/thGz8U+biyC/G0kfwcsEAeO
         rGsA==
X-Gm-Message-State: APjAAAXKW0ODYhhfCMt+BOBCPm6cBWgoUfICprHKyA3jvQLdG28N+8vn
        /A4SFQjbR+rxMl6Cy4kAMA==
X-Google-Smtp-Source: APXvYqzibAk/BZZeWuxQo95q5VLAhTtdp4PBSpp7c4gjshxKhd5T0HuqjAKwUjgZTZ8lKg0i+LtrTw==
X-Received: by 2002:a9d:6116:: with SMTP id i22mr21988439otj.13.1557862218171;
        Tue, 14 May 2019 12:30:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k65sm6608306oia.16.2019.05.14.12.30.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:30:17 -0700 (PDT)
Date:   Tue, 14 May 2019 14:30:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support
 for r7s9210
Message-ID: <20190514193017.GA18012@bogus>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-13-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-13-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 14 May 2019 09:56:02 -0500, Chris Brandt wrote:
> Add support for r7s9210 (RZ/A2M) SoC
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
