Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388AA19A0C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2020 23:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgCaV3C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Mar 2020 17:29:02 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:45430 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgCaV3C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Mar 2020 17:29:02 -0400
Received: by mail-il1-f196.google.com with SMTP id x16so20981916ilp.12;
        Tue, 31 Mar 2020 14:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kkvlt8/Qu8L0FOjwQCAMUHyd9CkHdAVLhm7bVH6k0Os=;
        b=FuosEFuDaIGv1JZ8vwuATRx2ma6Z8EpGSBeg7hzO+StfKLUI98+T6n4n47NMCsqj8i
         c5qKHQ8ZUz/Xgr3lxk04B8IJvoTDwXpnrfyJ/xElr+KvwT8BT6O/MLzsFm3GmWXHsdZU
         Un/rTWCeChuVH/csQqTp3Gy4XqKLjhsy80IIzglIz7USjigiqnmw0nkhSzV5jpL23UKw
         ZSVdLothR24FIGHVtDimY58MqRAGwjyiktgJ56PtKdwqjEYEzmkLFkb6APNt9zlJ4inD
         Ycii1P+D445hM13RD5lMFzRv69SebnQgBJo9aQf0fVWzU52ReRuN55p2Nw+u+IhabWrq
         /e6g==
X-Gm-Message-State: ANhLgQ0sSK7ZHoMfLEwDiWFjHHqiiAMHLE9Tb/pCguOxA5xgKTRL4Yx9
        VTTTr+CCMmMgdpQGGyEurw==
X-Google-Smtp-Source: ADFU+vs8rrwwBfgqZsedXMcfqhov0x+4IQyETdV1XOaXEzpLKlk5hqcbe40ixwQa4QeSisLTDzecaw==
X-Received: by 2002:a92:8517:: with SMTP id f23mr19418072ilh.106.1585690141676;
        Tue, 31 Mar 2020 14:29:01 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c28sm25422ilf.26.2020.03.31.14.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 14:29:00 -0700 (PDT)
Received: (nullmailer pid 27765 invoked by uid 1000);
        Tue, 31 Mar 2020 21:28:57 -0000
Date:   Tue, 31 Mar 2020 15:28:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: serial: sh-sci: Convert to json-schema
Message-ID: <20200331212857.GA27690@bogus>
References: <20200325095721.11946-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325095721.11946-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 25 Mar 2020 10:57:21 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas Serial Communication Interface ((H)SCI(F)(A|B))
> Device Tree binding documentation to json-schema.
> 
> Split the bindings in 5 files, one per major type, to ease expressing
> constraints.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop paragraph about aliases,
>   - Fix power-domains and resets to maxItems 1,
>   - Use a single const compatible value for SCI,
>   - Use lists of descriptions and const values for interrupts resp.
>     interrupt-names for SCI and SCIF,
>   - Use multiple possible lists of descriptions and const values for
>     interrupts resp. interrupt-names for SCIF.
> ---
>  .../bindings/serial/renesas,hscif.yaml        | 135 ++++++++++++++
>  .../bindings/serial/renesas,sci-serial.txt    | 150 ---------------
>  .../bindings/serial/renesas,sci.yaml          |  69 +++++++
>  .../bindings/serial/renesas,scif.yaml         | 172 ++++++++++++++++++
>  .../bindings/serial/renesas,scifa.yaml        | 107 +++++++++++
>  .../bindings/serial/renesas,scifb.yaml        |  98 ++++++++++
>  6 files changed, 581 insertions(+), 150 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,hscif.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,sci.yaml
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,scif.yaml
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,scifa.yaml
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,scifb.yaml
> 

Applied, thanks.

Rob
