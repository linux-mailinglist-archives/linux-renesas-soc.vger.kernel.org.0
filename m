Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF401E6D55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 23:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407530AbgE1VMH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 17:12:07 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37949 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407473AbgE1VMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 17:12:06 -0400
Received: by mail-il1-f196.google.com with SMTP id q18so391791ilm.5;
        Thu, 28 May 2020 14:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kwZcN1GUUx2LB8qBd4V2JckujeUBV5KSUJ8D+sfgEIM=;
        b=YdtnIPbXTgF1huzoshCzew0wM00YStEYZrd/DtTYora7szokSyoFTj5puGOo+vs/Ut
         9LCY4gW9Zkk+faNaGP6XA32kGNrbONu23o/CB8DbRxaIIjamBZMNBOoDdQ1GfDxw0QKj
         X/g9Gu8+jGU8FQoxsx38ZhAsG4HgCy5/RtFl55jHV9ea/OeZzdGnKk/W3OQ/8D+Fbb2Z
         pnmzRMJlEqPH6zlR7ap2t4Dt7Y9p4ETu+806SiTQS6NPhn05S0PiAW7EKCwSuKKkROqt
         /MRIOQ3yGIIPR2sg++LQLnjIZq6HffggZpnWxtQ8zPn/fVTGeazVtpn79Ivzwlufdd6Q
         dJjA==
X-Gm-Message-State: AOAM530+sJ8vAhElCjECsVJayk5KLXAhb3bqHsVKgTbj8QOWZbx6CENB
        kDUoeve6UqP/2JMaCY4GPHOsZuU=
X-Google-Smtp-Source: ABdhPJzMurIzEmbcw6Qthl2UI2kxjYlhPgTQ3xPSEPNHj57GGAgGZIu/rPVmQSLdTiJ+JEIM1gK/ew==
X-Received: by 2002:a92:8946:: with SMTP id n67mr4232884ild.215.1590700325259;
        Thu, 28 May 2020 14:12:05 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v13sm3857038ili.15.2020.05.28.14.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:12:04 -0700 (PDT)
Received: (nullmailer pid 693042 invoked by uid 1000);
        Thu, 28 May 2020 21:12:03 -0000
Date:   Thu, 28 May 2020 15:12:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: Add renesas,em-uart bindings
Message-ID: <20200528211203.GA692986@bogus>
References: <20200519080945.28798-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519080945.28798-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 10:09:45 +0200, Geert Uytterhoeven wrote:
> Document Device Tree bindings for the Renesas EMMA Mobile UART
> Interface.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/serial/renesas,em-uart.yaml      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> 

Applied, thanks!
