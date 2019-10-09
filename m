Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206BDD0A23
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 10:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbfJIItM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 04:49:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43602 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfJIItL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 04:49:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id n14so1597476ljj.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2019 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fw68qKfNBJ3MG20DUBqZIzVWDe20WI/LhFnx7roFxhs=;
        b=k8jh3KUK49JxXE6byOUawxlBLoaHRDdaZPoEFbuQJTg4/15q2NUtUb/W5jpqOyX6bS
         rqDd/e1ZuWc5mygYvEpbOYoHqosAx+8LI4KBntbJQqqGN7UVpY7NlNOHk8oksgUNmCok
         alhnWOJLr8ca/e0Fpa2MtDm0bMkwDRGDMi8Gnc2BzNTf/I4s1r91pjeHfu8pnqsd04x4
         FB7NN83/9VJjtlGjWiwfTVlBDJYCCerQeFvFG6Ti2iVeF+uR34VIo84hAyNPRrIZiCNB
         9h4SWjpYnfhXcgO1qzySVBeKfC3cJjr+84SodfHoEqN8Gx26E3kcZFbCRBOvZN4vh4Cy
         5uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fw68qKfNBJ3MG20DUBqZIzVWDe20WI/LhFnx7roFxhs=;
        b=GEFmRf9tGbN96kHp5KO3YSQ14qrh6s/too0bWTKWcBiIgvc02H8KIAjW/RX5UBhkDB
         4FgL/0ZGhrifwdow2C8EXGenKEC2u35OPboixe4s05qNOlYj38q6yp2Zykv/o6UPFxTA
         McK1YYOnRR6scdR4Jn0d78vIKZr/QeKH7qMgCFr30Qzqn3fl+d3JsI0mNnuoPa4OTPcA
         eo5ZYGe5jtj7T5eP/KCsJX0fSfLIW/+ebHSdru+65OudsnDXNZHK3f1IFrwZe9mpVKe5
         uhO/t1/F7zSuVrNIklnem72PYoBJauulAr5qZlqlfsWdnXAArvebejqBBjcxsK0b5Ooc
         WfMA==
X-Gm-Message-State: APjAAAXwg/TmHeCaciMnOM0LVqQAitFq0vdP1BrKFZxLuBZ/OqQZYzLx
        MfSMJQibEfYhMvg7FeD0JTNDzBDIUSepaQ==
X-Google-Smtp-Source: APXvYqwRBfPUz4nmbVDYIdMECrm/KMEnqoMdu7wPMUcBwNhPxmh9+WUSgtLHQd3IGwU9SeIICSilUg==
X-Received: by 2002:a2e:5dd5:: with SMTP id v82mr1629021lje.54.1570610949674;
        Wed, 09 Oct 2019 01:49:09 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:88d:9246:fcd9:ed2e:f8ad:568f? ([2a00:1fa0:88d:9246:fcd9:ed2e:f8ad:568f])
        by smtp.gmail.com with ESMTPSA id z72sm312363ljb.98.2019.10.09.01.49.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 01:49:08 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: rcar: Fix writing the MACCTLR register value
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        horms@verge.net.au, linux-pci@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
References: <1570593791-6958-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2b0f09cd-323d-864d-09df-40d431693f19@cogentembedded.com>
Date:   Wed, 9 Oct 2019 11:48:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570593791-6958-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09.10.2019 7:03, Yoshihiro Shimoda wrote:

> According to the R-Car Gen2/3 manual, the bit 0 of MACCTLR register
> should be written to 0 because the register is set to 1 on reset.

    The bit 0 set to 1, not the whole register (it has 1s also in the
bits 16-23).

> To avoid unexpected behaviors from this incorrect setting, this
> patch fixes it.
> 
> Fixes: b3327f7fae66 ("PCI: rcar: Try increasing PCIe link speed to 5 GT/s at boot")
> Cc: <stable@vger.kernel.org> # v4.9+
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
