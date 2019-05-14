Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C25F1CFE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 21:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfENT3l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 15:29:41 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44978 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfENT3k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 15:29:40 -0400
Received: by mail-oi1-f196.google.com with SMTP id z65so5808453oia.11;
        Tue, 14 May 2019 12:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h8PoErt2HRNSihPjSnjmpcMmHpjgLPulvVUSQYDE9A4=;
        b=O0fZ5oljBeJWaVE0S+s8vD099YZEUu25fbI5UsExVCM34TxwIfCG2F2/2Ny31f2krz
         jTYQTkzm0li14fupP53pTYsFXaNEbvUFq17NN4vWmVrSkeHTr1AZV67yKutvHv1jfc1J
         Xvdwr+Pjt3cM67FEPM4GohRnh0xcsIe+uU1JqzX2HAWwVwRTTy3NO1nciSMfM/Z/UHaP
         sHUimq1BPbmGhXo/EeRf+ZG18toyC3u7dYecBmEgQW0TtCO7P+idYM7iq6RwDIRnyUty
         0vJHpSu7eBC2bToiBuJk/PNFSriFhQ87NYgu0bEHSQvhiEWfT5bx15Is+yidztuq4n99
         QZqw==
X-Gm-Message-State: APjAAAX0i9YFvKOxY+66RB0jmfVx/zaRvQx6Jy9rdNl+WOhD8rT+JVG6
        gIJJmZY0eX1m9vFLUMPlStZ3O8U=
X-Google-Smtp-Source: APXvYqypEWOgUw2P4EDegYRZrrvzT2UY/P7DLGo3RO89Jutw2DMUZ359BfALh6vPXWHN31kQv1Vf0w==
X-Received: by 2002:aca:a98b:: with SMTP id s133mr3724700oie.146.1557862179914;
        Tue, 14 May 2019 12:29:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r23sm5602262otg.49.2019.05.14.12.29.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 12:29:39 -0700 (PDT)
Date:   Tue, 14 May 2019 14:29:38 -0500
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
Subject: Re: [PATCH v3 06/15] dt-bindings: rcar-gen3-phy-usb2: Document
 dr_mode
Message-ID: <20190514192938.GA16580@bogus>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-7-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514145605.19112-7-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 14 May 2019 09:55:56 -0500, Chris Brandt wrote:
> Document the optional dr_mode property
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
