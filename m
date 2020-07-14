Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9142521EA74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 09:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgGNHmu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 03:42:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33446 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNHmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 03:42:50 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A82A5564;
        Tue, 14 Jul 2020 09:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594712566;
        bh=4hhCQO2f/XL/hGiM8axkrXZ0VQS2UJ7/NdqIi3i5E00=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=a5JTIty3ZgWVFY4VKIMlOn+UrRmd/jH9+LNf5dSBY0OI3wvlGB3w/FALHx3fF3KKG
         M0eKmTF6zvuFDFmyLDYEPyYdRpQ0puD4vl0cVF7PUwRRj/D4KbcPhLkr5PyzvE+ymT
         KLYMf78CgJmWO+YcV4znasHeclLVfHEH8v/9Sa04=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [kms-test] [PATCH] Add license and copyright information
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200713230438.2087-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 mQINBFYE/WYBEACs1PwjMD9rgCu1hlIiUA1AXR4rv2v+BCLUq//vrX5S5bjzxKAryRf0uHat
 V/zwz6hiDrZuHUACDB7X8OaQcwhLaVlq6byfoBr25+hbZG7G3+5EUl9cQ7dQEdvNj6V6y/SC
 rRanWfelwQThCHckbobWiQJfK9n7rYNcPMq9B8e9F020LFH7Kj6YmO95ewJGgLm+idg1Kb3C
 potzWkXc1xmPzcQ1fvQMOfMwdS+4SNw4rY9f07Xb2K99rjMwZVDgESKIzhsDB5GY465sCsiQ
 cSAZRxqE49RTBq2+EQsbrQpIc8XiffAB8qexh5/QPzCmR4kJgCGeHIXBtgRj+nIkCJPZvZtf
 Kr2EAbc6tgg6DkAEHJb+1okosV09+0+TXywYvtEop/WUOWQ+zo+Y/OBd+8Ptgt1pDRyOBzL8
 RXa8ZqRf0Mwg75D+dKntZeJHzPRJyrlfQokngAAs4PaFt6UfS+ypMAF37T6CeDArQC41V3ko
 lPn1yMsVD0p+6i3DPvA/GPIksDC4owjnzVX9kM8Zc5Cx+XoAN0w5Eqo4t6qEVbuettxx55gq
 8K8FieAjgjMSxngo/HST8TpFeqI5nVeq0/lqtBRQKumuIqDg+Bkr4L1V/PSB6XgQcOdhtd36
 Oe9X9dXB8YSNt7VjOcO7BTmFn/Z8r92mSAfHXpb07YJWJosQOQARAQABtDBLaWVyYW4gQmlu
 Z2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT6JAlcEEwEKAEECGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQLdeYP70o/eNy1HqhHkZyEKRh/QUCXWTtygUJ
 CyJXZAAKCRChHkZyEKRh/f8dEACTDsbLN2nioNZMwyLuQRUAFcXNolDX48xcUXsWS2QjxaPm
 VsJx8Uy8aYkS85mdPBh0C83OovQR/OVbr8AxhGvYqBs3nQvbWuTl/+4od7DfK2VZOoKBAu5S
 QK2FYuUcikDqYcFWJ8DQnubxfE8dvzojHEkXw0sA4igINHDDFX3HJGZtLio+WpEFQtCbfTAG
 YZslasz1YZRbwEdSsmO3/kqy5eMnczlm8a21A3fKUo3g8oAZEFM+f4DUNzqIltg31OAB/kZS
 enKZQ/SWC8PmLg/ZXBrReYakxXtkP6w3FwMlzOlhGxqhIRNiAJfXJBaRhuUWzPOpEDE9q5YJ
 BmqQL2WJm1VSNNVxbXJHpaWMH1sA2R00vmvRrPXGwyIO0IPYeUYQa3gsy6k+En/aMQJd27dp
 aScf9am9PFICPY5T4ppneeJLif2lyLojo0mcHOV+uyrds9XkLpp14GfTkeKPdPMrLLTsHRfH
 fA4I4OBpRrEPiGIZB/0im98MkGY/Mu6qxeZmYLCcgD6qz4idOvfgVOrNh+aA8HzIVR+RMW8H
 QGBN9f0E3kfwxuhl3omo6V7lDw8XOdmuWZNC9zPq1UfryVHANYbLGz9KJ4Aw6M+OgBC2JpkD
 hXMdHUkC+d20dwXrwHTlrJi1YNp6rBc+xald3wsUPOZ5z8moTHUX/uPA/qhGsbkCDQRWBP1m
 ARAAzijkb+Sau4hAncr1JjOY+KyFEdUNxRy+hqTJdJfaYihxyaj0Ee0P0zEi35CbE6lgU0Uz
 tih9fiUbSV3wfsWqg1Ut3/5rTKu7kLFp15kF7eqvV4uezXRD3Qu4yjv/rMmEJbbD4cTvGCYI
 d6MDC417f7vK3hCbCVIZSp3GXxyC1LU+UQr3fFcOyCwmP9vDUR9JV0BSqHHxRDdpUXE26Dk6
 mhf0V1YkspE5St814ETXpEus2urZE5yJIUROlWPIL+hm3NEWfAP06vsQUyLvr/GtbOT79vXl
 En1aulcYyu20dRRxhkQ6iILaURcxIAVJJKPi8dsoMnS8pB0QW12AHWuirPF0g6DiuUfPmrA5
 PKe56IGlpkjc8cO51lIxHkWTpCMWigRdPDexKX+Sb+W9QWK/0JjIc4t3KBaiG8O4yRX8ml2R
 +rxfAVKM6V769P/hWoRGdgUMgYHFpHGSgEt80OKK5HeUPy2cngDUXzwrqiM5Sz6Od0qw5pCk
 NlXqI0W/who0iSVM+8+RmyY0OEkxEcci7rRLsGnM15B5PjLJjh1f2ULYkv8s4SnDwMZ/kE04
 /UqCMK/KnX8pwXEMCjz0h6qWNpGwJ0/tYIgQJZh6bqkvBrDogAvuhf60Sogw+mH8b+PBlx1L
 oeTK396wc+4c3BfiC6pNtUS5GpsPMMjYMk7kVvEAEQEAAYkCPAQYAQoAJgIbDBYhBJAt15g/
 vSj943LUeqEeRnIQpGH9BQJdizzIBQkLSKZiAAoJEKEeRnIQpGH9eYgQAJpjaWNgqNOnMTmD
 MJggbwjIotypzIXfhHNCeTkG7+qCDlSaBPclcPGYrTwCt0YWPU2TgGgJrVhYT20ierN8LUvj
 6qOPTd+Uk7NFzL65qkh80ZKNBFddx1AabQpSVQKbdcLb8OFs85kuSvFdgqZwgxA1vl4TFhNz
 PZ79NAmXLackAx3sOVFhk4WQaKRshCB7cSl+RIng5S/ThOBlwNlcKG7j7W2MC06BlTbdEkUp
 ECzuuRBv8wX4OQl+hbWbB/VKIx5HKlLu1eypen/5lNVzSqMMIYkkZcjV2SWQyUGxSwq0O/sx
 S0A8/atCHUXOboUsn54qdxrVDaK+6jIAuo8JiRWctP16KjzUM7MO0/+4zllM8EY57rXrj48j
 sbEYX0YQnzaj+jO6kJtoZsIaYR7rMMq9aUAjyiaEZpmP1qF/2sYenDx0Fg2BSlLvLvXM0vU8
 pQk3kgDu7kb/7PRYrZvBsr21EIQoIjXbZxDz/o7z95frkP71EaICttZ6k9q5oxxA5WC6sTXc
 MW8zs8avFNuA9VpXt0YupJd2ijtZy2mpZNG02fFVXhIn4G807G7+9mhuC4XG5rKlBBUXTvPU
 AfYnB4JBDLmLzBFavQfvonSfbitgXwCG3vS+9HEwAjU30Bar1PEOmIbiAoMzuKeRm2LVpmq4
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <d9a71f52-be59-8949-0203-5e7671419bc7@ideasonboard.com>
Date:   Tue, 14 Jul 2020 08:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200713230438.2087-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 14/07/2020 00:04, Laurent Pinchart wrote:
> Add SPDX tags to describe license and copyright information to all files
> in the repository.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Makefile                         | 2 ++
>  README                           | 3 +++
>  tests/Makefile                   | 2 ++
>  tests/kms-test-allplanes.py      | 2 ++
>  tests/kms-test-brxalloc.py       | 2 ++
>  tests/kms-test-connectors.py     | 2 ++
>  tests/kms-test-crc.py            | 2 ++
>  tests/kms-test-formats.py        | 2 ++
>  tests/kms-test-legacy-modeset.py | 2 ++
>  tests/kms-test-modes.py          | 2 ++
>  tests/kms-test-modeset.py        | 2 ++
>  tests/kms-test-pageflip.py       | 2 ++
>  tests/kms-test-planeposition.py  | 2 ++
>  tests/kms-test-routing.py        | 2 ++
>  tests/kmstest.py                 | 2 ++
>  15 files changed, 31 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3fe6ed9604bc..1f0da15546b8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  SUBDIRS=tests
>  
>  recursive=all clean install
> diff --git a/README b/README
> index 69a3bc5eef6c..7f770d4170a3 100644
> --- a/README
> +++ b/README
> @@ -1,3 +1,6 @@
> +.. SPDX-License-Identifier: CC-BY-SA-4.0
> +.. SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation

As you are only now adding this, wouldn't you make this 2020 ?
Or have you chosen the date the file was created?


Hrm, ok, so every addition has different values, so I can assume you are
taking the years in which modifications have been made to the file.

Seems extraneous, but it's fine.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +
>  du-tests
>  --------
>  
> diff --git a/tests/Makefile b/tests/Makefile
> index 521761af28cf..0a921e5f56cd 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: CC0-1.0
> +
>  SCRIPTS=$(wildcard *.py)
>  
>  all:
> diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
> index ca7baa07af42..d88326293782 100755
> --- a/tests/kms-test-allplanes.py
> +++ b/tests/kms-test-allplanes.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
> index a0ae46a8b53e..dbdc78946b04 100755
> --- a/tests/kms-test-brxalloc.py
> +++ b/tests/kms-test-brxalloc.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2018-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
> index 25fc5dc8f60e..4c58b99f8fbf 100755
> --- a/tests/kms-test-connectors.py
> +++ b/tests/kms-test-connectors.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
> index e0e0eabd9950..d936d1d4fb90 100755
> --- a/tests/kms-test-crc.py
> +++ b/tests/kms-test-crc.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
> index 15e6f591aea9..77c9fe775a7c 100755
> --- a/tests/kms-test-formats.py
> +++ b/tests/kms-test-formats.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
> index 17a81792a2b8..4b5605345391 100755
> --- a/tests/kms-test-legacy-modeset.py
> +++ b/tests/kms-test-legacy-modeset.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2018-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
> index 82a1a3b21e93..b298a19beedf 100755
> --- a/tests/kms-test-modes.py
> +++ b/tests/kms-test-modes.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
> index 224b39143a8e..0dbe67fb2a4f 100755
> --- a/tests/kms-test-modeset.py
> +++ b/tests/kms-test-modeset.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
> index bef1f4990a10..19c3adaa601f 100755
> --- a/tests/kms-test-pageflip.py
> +++ b/tests/kms-test-pageflip.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
> index ac4b4d0eb407..a7cc11113aa9 100755
> --- a/tests/kms-test-planeposition.py
> +++ b/tests/kms-test-planeposition.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
> index a24dc1c0fb1e..806adb8c68a8 100755
> --- a/tests/kms-test-routing.py
> +++ b/tests/kms-test-routing.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2019 Renesas Electronics Corporation
>  
>  import kmstest
>  import pykms
> diff --git a/tests/kmstest.py b/tests/kmstest.py
> index 8a483d7b5259..f13e3fb7aa32 100755
> --- a/tests/kmstest.py
> +++ b/tests/kmstest.py
> @@ -1,4 +1,6 @@
>  #!/usr/bin/python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
>  
>  import collections.abc
>  import errno
> 

-- 
Regards
--
Kieran
