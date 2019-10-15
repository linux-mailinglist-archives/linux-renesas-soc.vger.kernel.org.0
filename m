Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527B7D7D5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 19:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbfJORUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 13:20:54 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34415 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfJORUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 13:20:53 -0400
Received: by mail-oi1-f195.google.com with SMTP id 83so17526405oii.1;
        Tue, 15 Oct 2019 10:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ji37kzlw7ftYQ7yxtCUIpz+2Y/80Bf/nugs6eTbza0I=;
        b=nG3l+6hXBchLkLwaYHKti4AlyBFSlA89FS2EXJ6pF+U6uaOKBSD0pR/BmrDNuPEHAy
         HEX5UbjIznGjO58am8Z3tFFUMnT4qyxGweqOQfOIM5YnuxcMjWTxdWvALCOSDsPF61lk
         yKNTCGrA0LVbLJ1a6go6/OQBlcrIXz4AV3lgXc0UMkkubizjvROqJ7NcNOLVc7paian3
         4VlKD/CIKWs2slGggO6x7loRvyYbmnE36fCd1LwEhLOv/4HQQDNF9Yp9lxDOtPpc3A7W
         3uSxfTePTLYXo+dshZ2VyWCpL3xJu8no7immmryPDS3OdbsqpohMq0DR4VkaRgaPNlNi
         39gA==
X-Gm-Message-State: APjAAAUP8Z/7SUPlcVPNcL0mG7vPbBiGBEH+9tNIW79W+0TYN+uO652B
        1wQZiZSEFmEAsw7d/1vEcw==
X-Google-Smtp-Source: APXvYqxi6R2bKxpNOIe2GhkpMc+IsJemOIX3RSVcijYeBAOPIp6XUSIYFAu42jyIQu8BFr+GgeRxqg==
X-Received: by 2002:aca:35d6:: with SMTP id c205mr30475851oia.59.1571160052797;
        Tue, 15 Oct 2019 10:20:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l4sm6619497otj.64.2019.10.15.10.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:20:52 -0700 (PDT)
Date:   Tue, 15 Oct 2019 12:20:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: irqchip: renesas-irqc: Document r8a774b1
 bindings
Message-ID: <20191015172051.GA27996@bogus>
References: <1570173363-4633-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570173363-4633-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri,  4 Oct 2019 08:16:03 +0100, Biju Das wrote:
> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks.

Rob
