Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE086183991
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 20:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgCLTfR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 15:35:17 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44122 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbgCLTfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 15:35:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id a49so4795514otc.11;
        Thu, 12 Mar 2020 12:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HrZkIJxg/+ZV9GAin+mBxAngwb0tKSCnxdSff2SGThI=;
        b=O+pEB4Tlv1ehIK+rz4t29BMiJNGd0o37uHlQZV7wDOgbef/sIFRjFrpfGfWGvZctjp
         InkUapmKjILZq2lkfXOQ6MmeaKgWVqB4yaQNtUiwY6bzghgj8OHWkOAspmvA42xpqERD
         waHPJLc0yKuNxhmp0F1YaYWfVkVp4gXxcpMZ9ux1V/vrpcLYoXtyLyWD69avq4SckRMQ
         D0EAvmMJrrFhORGw3ukOWozqzylYykx208+RqFjddujUKqeZDGaTW5avJpc4RjM6Lkjw
         4IEle/rvdLOkhGan8d1JJ0WMDFcAZTh/nwRC6Rg2c4h8W6xsnxrm8NTgkMLIvkjNcSMD
         nU8A==
X-Gm-Message-State: ANhLgQ2gfdaTlZ0cITyFfd9Eh8KvLyCmzM7zcK5Tp9twfNr6Q5c3koy4
        kamdj72w+w1tfLRjXm3Y8A==
X-Google-Smtp-Source: ADFU+vv8P5S1puel9E9Jre8DhSr0txhJK7zkaaEx0ds1ts5UnTayYb1dSgN23/vsD+k8FZ+gQEhVbw==
X-Received: by 2002:a9d:7d8d:: with SMTP id j13mr7049343otn.166.1584041716645;
        Thu, 12 Mar 2020 12:35:16 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k101sm9613875otk.6.2020.03.12.12.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:35:15 -0700 (PDT)
Received: (nullmailer pid 8220 invoked by uid 1000);
        Thu, 12 Mar 2020 19:35:14 -0000
Date:   Thu, 12 Mar 2020 14:35:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sean Wang <sean.wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dt-bindings: serial: Convert generic and slave
 bindings to json-schema
Message-ID: <20200312193514.GA19903@bogus>
References: <20200306090046.8890-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306090046.8890-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 06, 2020 at 10:00:44AM +0100, Geert Uytterhoeven wrote:
> 	Hi Rob, Greg,
> 
> This patch series converts the generic serial interface and slave-device
> Device Tree bindings to json-schema.
> 
> Changes compared to v1[1]:
>   - Update references to serial.txt and slave-device.txt,
>   - Fix nodename pattern,
>   - Add missing maxItems to *-gpios,
>   - Express that uart-has-rtscts and [cr]ts-gpios are
>     mutually-exclusive,
>   - Drop examples,
>   - Allow any child node names,
>   - Typo s/connnected/connected/.
> 
> This is a dependency for converting more serial DT bindings that will
> refer to properties defined in serial.yaml.
> 
> This patch is based on next-20200306, which has a recent change to
> nextqualcomm-bluetooth.txt.

Basing it on next is not too useful. I'm inclined to apply and just drop 
what conflicts for me. We can fixup the reference after rc1.

Rob
