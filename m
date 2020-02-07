Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB86E1551C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2020 06:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgBGFTu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Feb 2020 00:19:50 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:54142 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726039AbgBGFTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Feb 2020 00:19:50 -0500
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 48DNsJ1cm4z2Dj
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2020 06:19:48 +0100 (CET)
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 48DNsG5q8qz4f3lwL;
        Fri,  7 Feb 2020 06:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1581052786;
        bh=xSzlTI5ByBzxomol2l57PFqBuDQF9cj7yVZ+PcN0FhE=; l=10;
        h=Subject:From:From:Reply-To:Sender;
        b=YO2lWcgGy6UTI4bYw3ixd0q+gdCXjjlzj4Npzwuv5o2tpwliLAxqTjZ3ET1pjwVL7
         t6/N5zv5hcGH3P5yOBXmGI/9/U4OhrXPWFMm+pQtzAhX0Cnzv0QtwTxdQdQFhTNssx
         DTDfX52PCtoCFR7qU8q4WMT4egnT0PEaXfH93y5c=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
        by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 48DNsG5P7Kz6CjQT8;
        Fri,  7 Feb 2020 06:19:46 +0100 (CET)
X-AuditID: 0a3aad0c-747ff70000004730-db-5e3cf372bc3d
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 11.46.18224.273FC3E5; Fri,  7 Feb 2020 06:19:46 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 48DNsG46N7zB0w;
        Fri,  7 Feb 2020 06:19:46 +0100 (CET)
Received: from [10.34.222.178] (10.34.222.178) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1847.3; Fri, 7 Feb 2020
 06:19:46 +0100
Subject: Re: [PATCH 2/3] clk: renesas: r8a7796: Add RPC clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200203072901.31548-1-dirk.behme@de.bosch.com>
 <20200203072901.31548-2-dirk.behme@de.bosch.com>
 <CAMuHMdWMcPwHM_-FgfYuum5yfNh=FxBgMM6rKjQbajjC=ZQ05A@mail.gmail.com>
From:   "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Message-ID: <e7dc17a6-ce3e-58aa-b3d5-4c5b43bee47f@de.bosch.com>
Date:   Fri, 7 Feb 2020 06:19:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWMcPwHM_-FgfYuum5yfNh=FxBgMM6rKjQbajjC=ZQ05A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.222.178]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sf0wTZxjH+96d7dFweBxiH6tMvS3GuACVbYpIxEWSsTmiLO4Pf6FFzraM
        tuSuODTLYMwQIG5Bh8Z2BI3i3MyMWpTWYdnssukImdqxWQoz1Rm2VqVlldhmge3Kge0f++95
        n+/zeb7v+81L4sywQk0aTBaON2mrWbmSUBacz8rmI4Xlmt5ry/NHfS4s/0pgDMsfOOdTrMdL
        /Ef/xUrc3zejkoj9hc34NmVhJVdt2Mfxuet2K/WPHg8SNRcUdYGjYawBjc1pRSkk0K/CsesP
        sFakJBn6OAad/d24dOhFMHn/Y7l0+AJBdMSliCMZ9DpwDg2LCEnOo7OhI4bF2zhthKst3YQ0
        34Mg1j6K4oKcXgWPumzTNUUXgfv01PQegn4JjjQ55PE6k94JPzqaFNJMOvxkfUjE6xS6DELH
        n+KSQT5YT9xCUq0C38MTM8aLwfGkA5eesxSu/N6uaEOMLWmVLQm3JeG2JPwkIs6h+Xs5zT6j
        Jm+NRpPDV3DCAc3KnD1mox1J2ac60Q9dOjfCSORGr5EYm0ndCBaWM2kV5sr9eq2g38XXVnMC
        q6bqH7fsZDKet4XaCqNBEAxmkxsBibPzqFu5a8oZqlK7/wDHmyXMjRaSBKuidOSmHQyt01q4
        9ziuhuNn1bUkyQJVPC4apvOcjqvba6i2zMpsFoVkMhkzP1lJtsXIFDd6hUwVvb/6W1xBCTVa
        o2DQzeALJJyZ7SbQfrSBHAp1ncIZwmQ2cWoVNRm/Ah2f1Neant9AvYi6UFZQzmQmCYktQTSE
        SMRmUK44nCp+6oQ3UA3xuNJnmgko74zI0H8S4Is6MYh4w3NgtG1cDl+Hf02Dzu7LcyE6cH0u
        RHyXVGIVU8FfB1uzYMI/sQQisScseK0PXoart09nQ7S9Iwes0UgehHvG1sJgo7cQRkK9G8A7
        9Usx3Dvf+BZ4o30bYSraVwotzvHNMBK5+w58GfhtC4z127dCZ99H2+His+5dcPOSVQeHbx+s
        gtjwKR6inpvvB8VgMTFYV9F0sBat5X+CnekmXqduQPxkoCrNb/asr6u/+BndGV7c92Gb/aTR
        cXew+efL49aW7+7QEztCjWp78zJ/aMudja5PehbeWG2QVX3wdCKozt1ttFc5e5uWPDtcVOYo
        eKNiz7ul9WctR3xvFw/ce/HNzxvOHvrn0KpA2UhwtUf7LXbNs/2bBf4/7m97vVQWKvYsQks/
        ZQlBr125AucF7X9gbmfSbgQAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 06.02.2020 16:47, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Mon, Feb 3, 2020 at 8:29 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
>> as well as the RPC-IF module clock, in the R-Car M3 (R8A7796) CPG/MSSR
>> driver.
>>
>> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>>
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Before I queue this in clk-renesas-for-v5.7: given the fuzz with the RPC
> driver, has this been tested successfully?


On a custom r8a7796 with 64MB Hyperflash attached I can read and write 
it via /dev/mtdx. Read data looks ok. Write data is byte swapped, but 
this is definitely a big-/little-endian driver issue. And not a clock one ;)

Best regards

Dirk



